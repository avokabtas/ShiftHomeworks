//
//  DetailView.swift
//  CollectionApp
//
//  Created by Aliia Satbakova  on 09.05.2024.
//

import UIKit

class DetailView: UIView {
    
    // MARK: - Delegate
    
    weak var delegate: DetailViewDelegate?
    
    // MARK: - UI Elements
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let typeTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Type"
        return label
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bestForTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Best For"
        return label
    }()
    
    private let bestForLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.text = "Price"
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var orderButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Order", for: .normal)
        button.backgroundColor = .systemGreen
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 10
        button.tintColor = .white
        button.addTarget(self, action: #selector(orderButtonTapped), for: .touchUpInside)
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
    
    // MARK: - Public Method
    
    func configure(with runningShoes: RunningShoes) {
        imageView.image = UIImage(named: runningShoes.image)
        typeLabel.text = runningShoes.type.rawValue
        bestForLabel.text = runningShoes.bestFor.rawValue
        priceLabel.text = runningShoes.price
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        addSubview(imageView)
        addSubview(typeTitleLabel)
        addSubview(typeLabel)
        addSubview(bestForTitleLabel)
        addSubview(bestForLabel)
        addSubview(priceTitleLabel)
        addSubview(priceLabel)
        addSubview(orderButton)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 400),
            imageView.heightAnchor.constraint(equalToConstant: 400),
            
            typeTitleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            typeTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            typeLabel.topAnchor.constraint(equalTo: typeTitleLabel.bottomAnchor, constant: 5),
            typeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            bestForTitleLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 10),
            bestForTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            bestForLabel.topAnchor.constraint(equalTo: bestForTitleLabel.bottomAnchor, constant: 5),
            bestForLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            priceTitleLabel.topAnchor.constraint(equalTo: bestForLabel.bottomAnchor, constant: 10),
            priceTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            priceLabel.topAnchor.constraint(equalTo: priceTitleLabel.bottomAnchor, constant: 5),
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            orderButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20),
            orderButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            orderButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            orderButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
        
    // MARK: - Action
    
    @objc private func orderButtonTapped() {
        delegate?.orderButtonTapped()
    }
}

// MARK: - DetailViewDelegate

protocol DetailViewDelegate: AnyObject {
    func orderButtonTapped()
}
