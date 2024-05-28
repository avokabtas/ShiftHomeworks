//
//  Assembly.swift
//  HW6
//
//  Created by Aliia Satbakova  on 27.05.2024.
//

import UIKit

enum Assembly {
    static func createCarListModule() -> UIViewController {
        let carDataService = CarDataService.shared
        let presenter = CarListPresenter(carDataService: carDataService)
        let view = CarListViewController(presenter: presenter)
        presenter.setView(view)
        return view
    }
    
    static func createCarDetailModule(with car: Car) -> UIViewController {
        let presenter = CarDetailPresenter(car: car)
        let view = CarDetailViewController(presenter: presenter)
        presenter.setView(view)
        return view
    }
}
