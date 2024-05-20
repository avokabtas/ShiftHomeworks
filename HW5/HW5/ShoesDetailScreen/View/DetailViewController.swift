//
//  DetailViewController.swift
//  CollectionApp
//
//  Created by Aliia Satbakova  on 08.05.2024.
//

import UIKit

protocol IDetailViewController: AnyObject {
    func present(_ viewController: UIViewController, animated: Bool)
}

class DetailViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private var presenter: IPresenter
    private var detailView: DetailView?
    
    // MARK: - Init
    
    init(runningShoes: RunningShoes) {
        self.presenter = Presenter(runningShoes: runningShoes)
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
    }
    
    // MARK: - Private Method
    
    private func setupDetailView() {
        let detailView = DetailView()
        detailView.delegate = self
        self.detailView = detailView
        view = detailView
        detailView.configure(with: presenter.getRunningShoes())
    }
}

// MARK: - DetailViewDelegate

extension DetailViewController: DetailViewDelegate {
    func orderButtonTapped() {
        presenter.orderButtonTapped()
    }
}

// MARK: - IDetailViewController

extension DetailViewController: IDetailViewController {
    func present(_ viewController: UIViewController, animated: Bool) {
        super.present(viewController, animated: true)
    }
}
