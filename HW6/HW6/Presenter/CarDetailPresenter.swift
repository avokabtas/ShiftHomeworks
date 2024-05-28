//
//  CarDetailPresenter.swift
//  HW6
//
//  Created by Aliia Satbakova  on 28.05.2024.
//

import UIKit

protocol ICarDetailPresenter: AnyObject {
    var bodyTypes: [String] { get }
    var selectedBodyType: String { get }
    func viewDidLoad()
    func loadCarDetails()
    func selectBodyType(_ bodyType: String)
    func calculatePrice()
    func setView(_ view: ICarDetailUI)
}

final class CarDetailPresenter: ICarDetailPresenter {
    weak var ui: ICarDetailUI?
    private var car: Car
    private(set) var selectedBodyType: String
    let bodyTypes: [String]
    
    init(car: Car) {
        self.car = car
        self.bodyTypes = ["Sedan", "Hatchback", "Wagon", "Crossover"].filter { car.bodyTypes.keys.contains($0) }
        self.selectedBodyType = self.bodyTypes.first ?? ""
    }
    
    func setView(_ view: ICarDetailUI) {
        self.ui = view
    }
    
    func viewDidLoad() {
        ui?.reloadTableView()
        updateViewForSelectedBodyType()
    }
    
    func loadCarDetails() {
        updateViewForSelectedBodyType()
    }
    
    func selectBodyType(_ bodyType: String) {
        selectedBodyType = bodyType
        ui?.reloadTableView()
        updateViewForSelectedBodyType()
    }
    
    func calculatePrice() {
        guard let bodyType = car.bodyTypes[selectedBodyType] else { return }
        ui?.displayCarDetails(image: UIImage(named: bodyType.photo), price: bodyType.price)
    }
    
    private func updateViewForSelectedBodyType() {
        guard let bodyTypeDetails = car.bodyTypes[selectedBodyType] else { return }
        ui?.displayCarDetails(image: UIImage(named: bodyTypeDetails.photo), price: nil)
    }
}
