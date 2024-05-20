//
//  Presenter.swift
//  HW5
//
//  Created by Aliia Satbakova  on 20.05.2024.
//

import Foundation

protocol IPresenter: AnyObject {
    var title: String { get }
    func getRunningShoes() -> RunningShoes
    func orderButtonTapped()
    func setView(_ view: DetailViewController)
}

class Presenter: IPresenter {
    private weak var ui: DetailViewController?
    private var runningShoes: RunningShoes
    
    init(runningShoes: RunningShoes) {
        self.runningShoes = runningShoes
    }
    
    func setView(_ view: DetailViewController) {
        self.ui = view
    }
    
    var title: String {
        "\(runningShoes.brand) \(runningShoes.model)"
    }
    
    func getRunningShoes() -> RunningShoes {
        return runningShoes
    }
    
    func orderButtonTapped() {
        let viewModel = ViewModel()
        let orderModalVC = OrderViewController(viewModel: viewModel)
        ui?.present(orderModalVC, animated: true)
    }
}
