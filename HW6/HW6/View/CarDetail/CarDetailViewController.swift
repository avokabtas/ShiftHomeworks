//
//  CarDetailViewController.swift
//  HW6
//
//  Created by Aliia Satbakova  on 27.05.2024.
//

import UIKit

protocol ICarDetailUI: AnyObject {
    func displayCarDetails(image: UIImage?, price: String?)
    func reloadTableView()
}

class CarDetailViewController: UIViewController {
    
    private let carDetailView = CarDetailView()
    private var presenter: ICarDetailPresenter
    
    init(presenter: ICarDetailPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        presenter.setView(self)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = carDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetailView()
        presenter.viewDidLoad()
        startLoadingAnimation()
    }
    
    private func setupDetailView() {
        view.backgroundColor = .white
        carDetailView.bodyTypeTableView.delegate = self
        carDetailView.bodyTypeTableView.dataSource = self
        carDetailView.bodyTypeTableView.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.identifier)
        carDetailView.delegate = self
        
    }
    
    private func startLoadingAnimation() {
        carDetailView.startIndicator()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.carDetailView.stopIndicator()
            self?.presenter.loadCarDetails()
        }
    }
    
}

extension CarDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.bodyTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as? DetailTableViewCell else {
            return UITableViewCell()
        }
        let bodyType = presenter.bodyTypes[indexPath.row]
        cell.configure(with: bodyType, isSelected: bodyType == presenter.selectedBodyType)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let bodyType = presenter.bodyTypes[indexPath.row]
        presenter.selectBodyType(bodyType)
    }
}

extension CarDetailViewController: ICarDetailUI {
    func displayCarDetails(image: UIImage?, price: String?) {
        carDetailView.carModelImageView.image = image
        carDetailView.priceLabel.text = price ?? "-"
    }
    
    func reloadTableView() {
        carDetailView.bodyTypeTableView.reloadData()
    }
}

extension CarDetailViewController: DetailViewDelegate {
    func priceButtonTapped() {
        presenter.calculatePrice()
    }
}
