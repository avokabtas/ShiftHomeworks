//
//  CarDetailView.swift
//  HW6
//
//  Created by Aliia Satbakova  on 28.05.2024.
//

import UIKit

class CarDetailView: UIView {
    
    weak var delegate: DetailViewDelegate?
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [carModelImageView, priceTitleLabel, priceLabel, bodyTypeLabel, bodyTypeTableView, priceButton])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let indicatorView: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    let carModelImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let priceTitleLabel: UILabel = {
        let label = UILabel()
        label.text = TextData.price.rawValue
        label.font = Font.title
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "-"
        return label
    }()
    
    private let bodyTypeLabel: UILabel = {
        let label = UILabel()
        label.text = TextData.bodyType.rawValue
        label.font = Font.title
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bodyTypeTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var priceButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Colour.accentColour
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.setTitle(TextData.buttonName.rawValue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(priceButtonTapped), for: .touchUpInside)
        button.addTarget(self, action: #selector(buttonTouchDown), for: .touchDown)
        button.addTarget(self, action: #selector(buttonTouchUp), for: [.touchUpInside, .touchUpOutside, .touchCancel])
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = Colour.backgroundColour
        addSubview(stackView)
        addSubview(indicatorView)
        startIndicator()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            carModelImageView.heightAnchor.constraint(equalToConstant: 196),
            
            priceButton.heightAnchor.constraint(equalToConstant: 51),
            
            indicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            indicatorView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    @objc func priceButtonTapped() {
        delegate?.priceButtonTapped()
    }
    
    @objc private func buttonTouchDown() {
        animateButton(scale: 0.95, alpha: 0.7)
    }
    
    @objc private func buttonTouchUp() {
        animateButton(scale: 1.0, alpha: 1.0)
    }
    
    private func animateButton(scale: CGFloat, alpha: CGFloat) {
        UIView.animate(withDuration: 0.1, animations: {
            self.priceButton.transform = CGAffineTransform(scaleX: scale, y: scale)
            self.priceButton.alpha = alpha
        })
    }
    
    func startIndicator() {
        stackView.isHidden = true
        indicatorView.startAnimating()
    }
    
    func stopIndicator() {
        stackView.isHidden = false
        indicatorView.isHidden = true
        indicatorView.stopAnimating()
    }
}
