//
//  CarListPresenter.swift
//  HW6
//
//  Created by Aliia Satbakova  on 27.05.2024.
//

import Foundation

protocol ICarListPresenter: AnyObject {
    var carBrands: [String] { get }
    func loadCarBrands()
    func didSelectCarBrand(at index: Int)
    func setView(_ view: ICarListUI)
}

final class CarListPresenter: ICarListPresenter {
    private weak var ui: ICarListUI?
    private let carDataService: CarDataService
    private var cars: [Car] = []
    var carBrands: [String] = []
    
    init(carDataService: CarDataService) {
        self.carDataService = carDataService
    }
    
    func setView(_ view: ICarListUI) {
        self.ui = view
    }
    
    func loadCarBrands() {
        cars = carDataService.fetchCars()
        carBrands = cars.map { $0.brand }
        ui?.reloadTableView()
    }
    
    func didSelectCarBrand(at index: Int) {
        let selectedCar = cars[index]
        ui?.navigateToCarDetails(with: selectedCar)
    }
}
