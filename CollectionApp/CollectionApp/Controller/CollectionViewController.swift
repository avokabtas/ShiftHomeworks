//
//  CollectionViewController.swift
//  CollectionApp
//
//  Created by Aliia Satbakova  on 03.05.2024.
//

import UIKit

class CollectionViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let runningShoesData: [RunningShoes] = RunningShoes.runningShoesData
    
    private lazy var contentView: RunningShoesCollectionView = {
        let view = RunningShoesCollectionView()
        title = "Running Shoes"
        view.backgroundColor = .white
        view.collectionView.dataSource = self
        view.collectionView.delegate = self
        return view
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(contentView)
        contentView.frame = view.bounds
    }
}

// MARK: - Data Source

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return runningShoesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RunningShoesCollectionViewCell.identifier, for: indexPath) as? RunningShoesCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: runningShoesData[indexPath.item])
        return cell
    }
}

// MARK: - Delegate

extension CollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedRunningShoes = runningShoesData[indexPath.item]
        let detailViewController = DetailViewController(runningShoes: selectedRunningShoes)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
