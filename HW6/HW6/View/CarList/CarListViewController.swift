//
//  CarListViewController.swift
//  HW6
//
//  Created by Aliia Satbakova  on 27.05.2024.
//

import UIKit

protocol ICarListUI: AnyObject {
    func reloadTableView()
    func navigateToCarDetails(with car: Car)
}

class CarListViewController: UIViewController {
    
    private var carListView = CarListView()
    private var presenter: ICarListPresenter
    
    init(presenter: ICarListPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        presenter.setView(self)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = carListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter.loadCarBrands()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let indexPath = carListView.tableView.indexPathForSelectedRow {
            carListView.tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    private func setupTableView() {
        carListView.tableView.delegate = self
        carListView.tableView.dataSource = self
        carListView.tableView.register(CarListTableViewCell.self, forCellReuseIdentifier: CarListTableViewCell.identifier)
    }
}

extension CarListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.carBrands.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarListTableViewCell.identifier, for: indexPath) as? CarListTableViewCell else {
            return UITableViewCell()
        }
        cell.accessoryType = .disclosureIndicator
        cell.configure(with: presenter.carBrands[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectCarBrand(at: indexPath.row)
    }
}

extension CarListViewController: ICarListUI {
    func reloadTableView() {
        carListView.tableView.reloadData()
    }
    
    func navigateToCarDetails(with car: Car) {
        let detailVC = Assembly.createCarDetailModule(with: car)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
