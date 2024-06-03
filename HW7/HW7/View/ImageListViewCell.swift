//
//  ImageListViewCell.swift
//  HW7
//
//  Created by Aliia Satbakova  on 03.06.2024.
//

import UIKit

class ImageListViewCell: UITableViewCell {
    static let identifier = String(describing: ImageListViewCell.self)
    
    private let customImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
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
    
    func configure(with image: UIImage?) {
        customImageView.image = image
    }
    
    private func setupView() {
        contentView.addSubview(customImageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            customImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            customImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            customImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            customImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            customImageView.heightAnchor.constraint(equalToConstant: 400),
        ])
    }
}
