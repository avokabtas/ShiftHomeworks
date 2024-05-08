//
//  RunningShoesCollectionViewCell.swift
//  CollectionApp
//
//  Created by Aliia Satbakova  on 08.05.2024.
//

import UIKit

class RunningShoesCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: RunningShoesCollectionViewCell.self)
    
    // TODO: Это Черновик!
    // Нужно сделать:
    // Текст меньше - не влезает

    
    let imageShoesView = UIImageView()
    let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        // Configure image view
        imageShoesView.contentMode = .scaleAspectFit
        contentView.addSubview(imageShoesView)
        
        // Configure label
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        contentView.addSubview(titleLabel)
        
        // Constraints
        imageShoesView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
//        let stackView = UIStackView(arrangedSubviews: [imageShoesView, titleLabel])
//        stackView.axis = .vertical
//        stackView.spacing = 8
//        stackView.alignment = .center
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        contentView.addSubview(stackView)
//        
//        NSLayoutConstraint.activate([
//            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
//        ])
        NSLayoutConstraint.activate([
            imageShoesView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageShoesView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageShoesView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageShoesView.heightAnchor.constraint(equalTo: imageShoesView.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: imageShoesView.bottomAnchor, constant: -8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configure(with runningShoes: RunningShoes) {
        imageShoesView.image = UIImage(named: runningShoes.image)
        titleLabel.text = "\(runningShoes.brand) \(runningShoes.model)\n"
    }
}
