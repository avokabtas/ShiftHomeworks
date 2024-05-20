//
//  ViewModel.swift
//  HW5
//
//  Created by Aliia Satbakova  on 20.05.2024.
//

import Foundation

class ViewModel {
    
    // MARK: - Private Property
    
    private var order: Order
    
    // MARK: - Public Properties
    
    let defaultMessage: String
    
    var updateUI: ((_ newDataToDisplay: Order) -> Void)?
    
    // MARK: - Init
    
    init() {
        self.defaultMessage = "For technical reasons, placing an order in the mobile application is not available 😔\nPlease order via phone: 22-00-788\nThank you!"
        self.order = Order(message: defaultMessage)
        startTimer()
    }
    
    // MARK: - Private Methods
    
    private func updateData() {
        let updated = Order(message: defaultMessage)
        updateUI?(updated)
    }
    
    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: Double.random(in: 1...10), repeats: true) { [weak self] _ in
            self?.updateData()
        }
    }
}
