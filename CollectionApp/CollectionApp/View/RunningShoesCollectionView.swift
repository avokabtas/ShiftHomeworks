//
//  RunningShoesCollectionView.swift
//  CollectionApp
//
//  Created by Aliia Satbakova  on 08.05.2024.
//

import UIKit

class RunningShoesCollectionView: UIView {
    
    // MARK: - UI Elements
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(RunningShoesCollectionViewCell.self, forCellWithReuseIdentifier: RunningShoesCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        // Установка пользовательского макета
        collectionView.collectionViewLayout = setupFlowLayout()
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2 - 10, height: 200)
        layout.minimumInteritemSpacing = 5 // между ячейками
        layout.minimumLineSpacing = 10 // между рядами
        return layout
    }
}
