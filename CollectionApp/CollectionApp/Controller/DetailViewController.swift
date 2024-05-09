//
//  DetailViewController.swift
//  CollectionApp
//
//  Created by Aliia Satbakova  on 08.05.2024.
//

import UIKit

class DetailViewController: UIViewController, DetailViewDelegate {
    
    // MARK: - Private Properties
    
    private var runningShoes: RunningShoes
    private var detailView: DetailView!
    
    // MARK: - Init
    
    init(runningShoes: RunningShoes) {
        self.runningShoes = runningShoes
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "\(runningShoes.brand) \(runningShoes.model)"
        setupDetailView()
    }
    
    // MARK: - Private Method
    
    private func setupDetailView() {
        detailView = DetailView()
        detailView.delegate = self
        view = detailView
        detailView.configure(with: runningShoes)
    }
    
    // MARK: - DetailViewDelegate
    
    func orderButtonTapped() {
        let orderModalVC = OrderViewController(nibName: nil, bundle: nil)
        self.present(orderModalVC, animated: true)
    }
}
