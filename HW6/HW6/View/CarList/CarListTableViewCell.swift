//
//  CarListTableViewCell.swift
//  HW6
//
//  Created by Aliia Satbakova  on 28.05.2024.
//

import UIKit

class CarListTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: CarListTableViewCell.self)
    
    private let circleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "circle.fill")
        imageView.tintColor = Colour.accentColour
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let brandLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(circleImageView)
        addSubview(brandLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            circleImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            circleImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            brandLabel.leadingAnchor.constraint(equalTo: circleImageView.trailingAnchor, constant: 16),
            brandLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func configure(with brand: String) {
        brandLabel.text = brand
    }
}
