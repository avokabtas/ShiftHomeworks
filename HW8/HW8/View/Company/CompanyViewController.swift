//
//  CompanyListViewController.swift
//  HW8
//
//  Created by Aliia Satbakova  on 05.06.2024.
//

import UIKit

protocol ICompanyListUI: AnyObject {}

class CompanyViewController: UIViewController {
    
    private var presenter: ICompanyPresenter
    private var companyListView = CompanyListView()
    
    init(presenter: ICompanyPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
    }


}

extension CompanyViewController: ICompanyListUI {
    
}

extension CompanyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}

extension CompanyViewController: UITableViewDelegate {
    
}
