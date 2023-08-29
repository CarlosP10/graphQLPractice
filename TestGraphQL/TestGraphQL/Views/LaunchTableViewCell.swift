//
//  LaunchTableViewCell.swift
//  TestGraphQL
//
//  Created by Carlos Paredes on 24/8/23.
//

import UIKit

final class LaunchTableViewCell: UITableViewCell {
    static let identifier = "LaunchTableViewCell"
    
    private let customImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let labelTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let labelSubtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let labelDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: -Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViewsAndConstraints()
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        labelTitle.text = nil
        labelSubtitle.text = nil
        labelDescription.text = nil
    }
    
    //MARK: - Private
    private func setUpViewsAndConstraints() {
        selectionStyle = .none
        contentView.addSubviews(customImageView, stackView)
        stackView.addArrangedSubviews(labelTitle,labelSubtitle,labelDescription)
        
        NSLayoutConstraint.activate([
            customImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            customImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            customImageView.widthAnchor.constraint(equalTo: customImageView.heightAnchor, constant: 8),
            customImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 8),
            
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    public func configure(
        title: String = "Title",
        subtitle: String = "Subtitle",
        description: String = "Description"){
        labelTitle.text = title
        labelSubtitle.text = subtitle
        labelDescription.text = description
    }
}
