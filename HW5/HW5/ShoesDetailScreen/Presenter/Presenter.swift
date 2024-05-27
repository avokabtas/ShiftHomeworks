//
//  Presenter.swift
//  HW5
//
//  Created by Aliia Satbakova  on 20.05.2024.
//

import Foundation

protocol IPresenter: AnyObject {
    var title: String { get }
    func configureUI()
    func orderButtonTapped()
    func setView(_ view: IDetailViewController)
}

class Presenter: IPresenter {
    
    // MARK: - Private Properties
    
    private weak var ui: IDetailViewController?
    private var runningShoes: RunningShoes
    
    // MARK: - Init
    
    init(runningShoes: RunningShoes) {
        self.runningShoes = runningShoes
    }
    
    // MARK: - Public Property
    
    var title: String {
        "\(runningShoes.brand) \(runningShoes.model)"
    }
    
    // MARK: - Public Methods
    
    func setView(_ view: IDetailViewController) {
        self.ui = view
    }
    
    func configureUI() {
        ui?.configureView(with: runningShoes)
    }
    
    func orderButtonTapped() {
        let viewModel = ViewModel()
        let orderModalVC = OrderViewController(viewModel: viewModel)
        ui?.present(orderModalVC, animated: true)
    }
}
