//
//  LaunchesTableViewController.swift
//  rocker-launches
//
//  Created by Carlos Paredes on 29/8/23.
//

import SpaceXAPI
import UIKit

class LaunchesTableViewController: UITableViewController {
    
    var rocket: RocketsQuery.Data.Rocket!
    
    private let inDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z"
        return dateFormatter
    }()
    
    private let outDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d yyyy, h:mm a"
        return dateFormatter
    }()
    
    private var launchesUpcoming: [LaunchesQuery.Data.LaunchesUpcoming] = []
    private var launchesPast: [LaunchesQuery.Data.LaunchesPast] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = rocket.name
        fetchLaunches()
    }

    private func fetchLaunches() {
        let launchFind = LaunchFind(rocket_id: rocket.id ?? .none)
        let query = LaunchesQuery(upcomingFind: .some(launchFind), pastFind: .some(launchFind))
        NetworkService.shared.apollo.fetch(query: query) { [weak self] result in
            switch result {
            case .success(let value):
                self?.launchesUpcoming = value.data?.launchesUpcoming?.compactMap{ $0 } ?? []
                self?.launchesPast = value.data?.launchesPast?.compactMap{ $0 } ?? []
                self?.tableView.reloadData()
                
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Upcoming launches"
        case 1: return "Past launches"
        default: return nil
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return launchesUpcoming.count
        case 1: return launchesPast.count
        default: return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LaunchCell", for: indexPath)
        
        var contentConfiguration = UIListContentConfiguration.subtitleCell()
        
        let cellText: String
        let cellSecondaryText: String
        
        switch indexPath.section {
        case 0:
            let launchUpcoming = launchesUpcoming[indexPath.row]
            cellText = launchUpcoming.mission_name ?? ""
            let launchDate = inDateFormatter.date(from: launchUpcoming.launch_date_utc ?? "") ?? .now
            cellSecondaryText = outDateFormatter.string(from: launchDate)
        case 1:
            let launchPast = launchesPast[indexPath.row]
            cellText = launchPast.mission_name ?? ""
            let launchDate = inDateFormatter.date(from: launchPast.launch_date_utc ?? "") ?? .now
            cellSecondaryText = outDateFormatter.string(from: launchDate)
            
        default:
            cellText = ""
            cellSecondaryText = ""
        }
        
        contentConfiguration.text = cellText
        contentConfiguration.secondaryText = cellSecondaryText
        
        cell.contentConfiguration = contentConfiguration
        
        return cell
    }
}
