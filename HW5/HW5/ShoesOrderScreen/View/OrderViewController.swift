//
//  OrderViewController.swift
//  CollectionApp
//
//  Created by Aliia Satbakova  on 08.05.2024.
//

import UIKit

class OrderViewController: UIViewController {
    
    // MARK: - Private Property
    
    private var orderView: OrderView?
    private var viewModel: ViewModel
    
    // MARK: - Init
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOrderView()
        makeViewModel()
    }
    
    // MARK: - Private Method
    
    private func setupOrderView() {
        let orderView = OrderView()
        orderView.delegate = self
        self.orderView = orderView
        orderView.updateMessage(viewModel.initialMessage)
        if let orderView = self.orderView {
            view = orderView
        }
    }
    
    private func makeViewModel() {
        viewModel.message = { [weak self] orderMessage in
            self?.orderView?.updateMessage(orderMessage.message)
        }
    }
}

// MARK: - OrderViewDelegate

extension OrderViewController: OrderViewDelegate {
    func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}
