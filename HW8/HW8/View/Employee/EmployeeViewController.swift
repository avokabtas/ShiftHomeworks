//
//  EmployeeViewController.swift
//  HW8
//
//  Created by Aliia Satbakova  on 05.06.2024.
//

import UIKit

protocol IEmployeeListUI: AnyObject {}

class EmployeeViewController: UIViewController {
    
    private var presenter: IEmployeePresenter
    private var employeeListView = EmployeeListView()
    
    init(presenter: IEmployeePresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

}

extension EmployeeViewController: IEmployeeListUI {
    
}

extension EmployeeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}

extension EmployeeViewController: UITableViewDelegate {
    
}
