//
//  EmployeeListView.swift
//  HW8
//
//  Created by Aliia Satbakova  on 05.06.2024.
//

import UIKit

class EmployeeListView: UIView {

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
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        
    }
    
}
