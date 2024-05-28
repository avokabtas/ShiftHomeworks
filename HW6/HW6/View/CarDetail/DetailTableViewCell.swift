//
//  DetailTableViewCell.swift
//  HW6
//
//  Created by Aliia Satbakova  on 28.05.2024.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: DetailTableViewCell.self)
    
    private let bodyTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let selectionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = Colour.accentColour
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        addSubview(bodyTypeLabel)
        addSubview(selectionImageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            bodyTypeLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            bodyTypeLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            selectionImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            selectionImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            selectionImageView.widthAnchor.constraint(equalToConstant: 20),
            selectionImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func configure(with bodyType: String, isSelected: Bool) {
        bodyTypeLabel.text = bodyType
        selectionImageView.image = UIImage(systemName: isSelected ? "circle.circle.fill" : "circle")
    }
}
