//
//  OrderView.swift
//  CollectionApp
//
//  Created by Aliia Satbakova  on 09.05.2024.
//

import UIKit

class OrderView: UIView {
    
    weak var delegate: OrderViewDelegate?
    
    // MARK: - UI Elements
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Checkout"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "For technical reasons, placing an order in the mobile application is not available 😔\nPlease order via phone: 22-00-788\nThank you!"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Close", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Method
    
    private func setupView() {
        addSubview(titleLabel)
        addSubview(messageLabel)
        addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            
            messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            closeButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            closeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }
    
    // MARK: - Action
    
    @objc private func closeButtonTapped() {
        delegate?.closeButtonTapped()
    }
}

// MARK: - OrderViewDelegate

protocol OrderViewDelegate: AnyObject {
    func closeButtonTapped()
}
