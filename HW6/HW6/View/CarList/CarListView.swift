//
//  CarListView.swift
//  HW6
//
//  Created by Aliia Satbakova  on 28.05.2024.
//

import UIKit

class CarListView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Font.mainTitle
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.text = TextData.mainTitle.rawValue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let carBrandLabel: UILabel = {
        let label = UILabel()
        label.text = TextData.carBrandTitle.rawValue
        label.font = Font.title
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = Colour.backgroundColour
        addSubview(titleLabel)
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 43),
            tableView.centerXAnchor.constraint(equalTo: centerXAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
