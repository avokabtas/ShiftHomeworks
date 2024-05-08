//
//  CollectionViewController.swift
//  CollectionApp
//
//  Created by Aliia Satbakova  on 03.05.2024.
//

import UIKit

class CollectionViewController: UIViewController {
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let runningShoesData: [RunningShoes] = RunningShoes.runningShoesData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Running Shoes"
        

        // Установка пользовательского макета
        collectionView.collectionViewLayout = setupFlowLayout()
        
        
        collectionView.register(RunningShoesCollectionViewCell.self, forCellWithReuseIdentifier: RunningShoesCollectionViewCell.identifier)

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        //layout.itemSize = .init(width: 200, height: 200)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2 - 10, height: 200) // Половина ширины экрана и 200 по высоте
        layout.minimumInteritemSpacing = 5// Минимальный интервал между ячейками
        layout.minimumLineSpacing = 10 // Минимальный интервал между рядами
        return layout
    }
    
}

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

extension CollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedRunningShoes = runningShoesData[indexPath.item]
        let detailViewController = DetailViewController(runningShoes: selectedRunningShoes)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
