//
//  ImageListViewController.swift
//  HW7
//
//  Created by Aliia Satbakova  on 29.05.2024.
//

import UIKit

protocol IImageListUI: AnyObject {
    func showImages(_ images: [UIImage])
    func showError(_ error: String)
    func showLoadingProgress(_ progress: Float)
}

class ImageListViewController: UIViewController {
    
    private var presenter: IPresenter
    private var imageListView = ImageListView()
    private var images: [UIImage] = []
    
    init(presenter: IPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = imageListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigationBar()
    }
    
    private func setupView() {
        imageListView.searchBar.delegate = self
        imageListView.tableView.dataSource = self
        imageListView.tableView.register(ImageListViewCell.self, forCellReuseIdentifier: ImageListViewCell.identifier)
    }
    
    private func setupNavigationBar() {
        setupTitleNavigationBar()
        let pauseButton = UIBarButtonItem(barButtonSystemItem: .pause, target: self, action: #selector(pauseLoading))
        let resumeButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(resumeLoading))
        navigationItem.rightBarButtonItems = [pauseButton, resumeButton]
    }
    
    func setupTitleNavigationBar() {
        navigationItem.titleView = nil
        navigationItem.title = TextData.mainTitle.rawValue
    }
    
    func setupProgressView() {
        navigationItem.titleView = imageListView.progressView
        navigationItem.title = nil
    }
    
    @objc private func pauseLoading() {
        presenter.pauseImageLoad()
    }
    
    @objc private func resumeLoading() {
        presenter.resumeImageLoad()
    }
}

// MARK: - IImageListUI

extension ImageListViewController: IImageListUI {
    func showImages(_ images: [UIImage]) {
        self.images = images
        imageListView.tableView.reloadData()
        setupTitleNavigationBar()
    }
    
    func showError(_ error: String) {
        let alert = UIAlertController(title: TextData.errorTitle.rawValue, message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: TextData.okTitle.rawValue, style: .default))
        present(alert, animated: true)
        setupTitleNavigationBar()
    }
    
    func showLoadingProgress(_ progress: Float) {
        imageListView.progressView.isHidden = false
        imageListView.progressView.progress = progress
        setupProgressView()
    }
}

// MARK: - UISearchBarDelegate

extension ImageListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text, !query.isEmpty else { return }
        imageListView.progressView.progress = 0
        imageListView.progressView.isHidden = false
        setupProgressView()
        presenter.searchImages(for: query)
    }
}

// MARK: - UITableViewDataSource

extension ImageListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ImageListViewCell.identifier, for: indexPath)
                as? ImageListViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: images[indexPath.row])
        return cell
    }
}
