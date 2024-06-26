//
//  OrderViewController.swift
//  CollectionApp
//
//  Created by Aliia Satbakova  on 08.05.2024.
//

import UIKit

class OrderViewController: UIViewController, OrderViewDelegate {
    
    // MARK: - Private Property
    
    private var orderView: OrderView?
    
    // MARK: - Lifecycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOrderView()
    }
    
    // MARK: - Private Method
    
    private func setupOrderView() {
        let orderView = OrderView()
        orderView.delegate = self
        self.orderView = orderView
        if let orderView = self.orderView {
            view = orderView
        }
    }

    // MARK: - OrderViewDelegate
    
    func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}
