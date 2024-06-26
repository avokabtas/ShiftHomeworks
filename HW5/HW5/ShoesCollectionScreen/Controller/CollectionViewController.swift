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
        return view
    }()
    
    // MARK: - Lifecycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        contentView.collectionView.collectionViewLayout.invalidateLayout()
    }
    
    // MARK: - Private Method
    
    private func setupView() {
        title = "Running Shoes"
        view.backgroundColor = .white
        
        view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.collectionView.dataSource = self
        contentView.collectionView.delegate = self
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
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
        let presenter = Presenter(runningShoes: selectedRunningShoes)
        let detailViewController = DetailViewController(presenter: presenter)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

// MARK: - Flow Layout Delegate

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let isPortrait = UIDevice.current.orientation.isPortrait
        let screenWidth = UIScreen.main.bounds.width
        let cellWidth = isPortrait ? screenWidth / 2 - 10 : screenWidth / 2 - 20
        return CGSize(width: cellWidth, height: 200)
    }
}
