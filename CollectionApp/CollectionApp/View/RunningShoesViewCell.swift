//
//  RunningShoesCollectionViewCell.swift
//  CollectionApp
//
//  Created by Aliia Satbakova  on 08.05.2024.
//
//

import UIKit

class RunningShoesCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: RunningShoesCollectionViewCell.self)
    
    let shoesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [shoesImageView, titleLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(stackView)
        
        let contentMargin = contentView.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentMargin.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentMargin.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentMargin.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentMargin.bottomAnchor),
            
            titleLabel.bottomAnchor.constraint(equalTo: contentMargin.bottomAnchor)
        ])
    }
    
    func configure(with runningShoes: RunningShoes) {
        shoesImageView.image = UIImage(named: runningShoes.image)
        titleLabel.text = "\(runningShoes.brand) \(runningShoes.model)"
    }
}
