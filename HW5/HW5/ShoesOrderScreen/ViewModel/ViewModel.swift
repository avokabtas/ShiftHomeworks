//
//  ViewModel.swift
//  HW5
//
//  Created by Aliia Satbakova  on 20.05.2024.
//

import Foundation

class ViewModel {
    
    private var order: Order
    
    let initialMessage: String
    
    var message: ((Order) -> Void)?
    
    init() {
        self.initialMessage = "For technical reasons, placing an order in the mobile application is not available 😔\nPlease order via phone: 22-00-788\nThank you!"
        self.order = Order(message: initialMessage)
        startTimer()
    }
    
    private func updateData() {
        let updated = Order(message: initialMessage)
        message?(updated)
    }
    
    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: Double.random(in: 1...10), repeats: true) { [weak self] _ in
            self?.updateData()
        }
    }
}
