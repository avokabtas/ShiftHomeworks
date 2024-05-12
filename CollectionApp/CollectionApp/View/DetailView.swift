//
//  DetailView.swift
//  CollectionApp
//
//  Created by Aliia Satbakova  on 09.05.2024.

import UIKit

class DetailView: UIView {
    
    // MARK: - Delegate
    
    weak var delegate: DetailViewDelegate?
    
    // MARK: - Private Constants
        
    private let forTitle: CGFloat = 18
    
    // MARK: - UI Elements

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private func makeTitleLabel(textTitle: String, fontSize: CGFloat) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: fontSize)
        label.text = textTitle
        return label
    }
    
    private lazy var typeTitleLabel: UILabel = makeTitleLabel(textTitle: "Type", fontSize: forTitle)
    private lazy var bestForTitleLabel: UILabel = makeTitleLabel(textTitle: "Best For", fontSize: forTitle)
    private lazy var priceTitleLabel: UILabel = makeTitleLabel(textTitle: "Price", fontSize: forTitle)

    private func makeDescriptionsLabels() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private lazy var typeLabel: UILabel = makeDescriptionsLabels()
    private lazy var bestForLabel: UILabel = makeDescriptionsLabels()
    private lazy var priceLabel: UILabel = makeDescriptionsLabels()
    
    private lazy var orderButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Order", for: .normal)
        button.backgroundColor = .systemGreen
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
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
    
    @available(*, unavailable)
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
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imageView)
        contentView.addSubview(typeTitleLabel)
        contentView.addSubview(typeLabel)
        contentView.addSubview(bestForTitleLabel)
        contentView.addSubview(bestForLabel)
        contentView.addSubview(priceTitleLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(orderButton)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: widthAnchor),
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
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
            orderButton.heightAnchor.constraint(equalToConstant: 50),
            orderButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
        
    // MARK: - Action Button
    
    @objc private func orderButtonTapped() {
        delegate?.orderButtonTapped()
    }
}
