//
//  DetailViewController.swift
//  CollectionApp
//
//  Created by Aliia Satbakova  on 08.05.2024.
//

import UIKit

protocol IDetailUI: AnyObject {
    func present(_ viewController: UIViewController, animated: Bool)
    func configureView(with runningShoes: RunningShoes)
}

class DetailViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private var presenter: IPresenter
    private var detailView: DetailView?
    
    // MARK: - Init
    
    init(presenter: IPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        presenter.setView(self)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = presenter.title
        setupDetailView()
        presenter.configureUI()
    }
    
    // MARK: - Private Method
    
    private func setupDetailView() {
        let detailView = DetailView()
        detailView.delegate = self
        self.detailView = detailView
        view = detailView
    }
}

// MARK: - DetailViewDelegate

extension DetailViewController: DetailViewDelegate {
    func orderButtonTapped() {
        presenter.orderButtonTapped()
    }
}

// MARK: - IDetailUI

extension DetailViewController: IDetailUI {
    func present(_ viewController: UIViewController, animated: Bool) {
        super.present(viewController, animated: true)
    }
    
    func configureView(with runningShoes: RunningShoes) {
        detailView?.configure(with: runningShoes)
    }
}
