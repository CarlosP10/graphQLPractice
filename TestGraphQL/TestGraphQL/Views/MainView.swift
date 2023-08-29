//
//  MainView.swift
//  TestGraphQL
//
//  Created by Carlos Paredes on 24/8/23.
//

import UIKit

final class MainView: UIView {
    //MARK: - UI
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.clipsToBounds = true
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let topLabel: UILabel = {
        let label = UILabel()
        label.text = "GraphQL Example"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(
            LaunchTableViewCell.self,
            forCellReuseIdentifier: LaunchTableViewCell.identifier
        )
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var spinner: UIActivityIndicatorView?
    
    //MARK: -Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        setUpViewsAndConstraints()
    }
    
    //MARK: - Private
    private func setUpViewsAndConstraints() {
        //Adding Views
        spinner = SpinnerUtility.addSpinner(to: self)
        addSubview(stackView)
        stackView.addArrangedSubviews(topLabel, tableView)
        
        //Constrains Views
        addAndPinArea(stackView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
