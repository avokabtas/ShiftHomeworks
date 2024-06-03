//
//  ImageListViewController.swift
//  HW7
//
//  Created by Aliia Satbakova  on 29.05.2024.
//

//import UIKit
//
//protocol IImageListUI: AnyObject {
//    func showImages(_ images: [UIImage])
//    func showError(_ error: String)
//    func showLoadingProgress(_ progress: Float)
//}
//
//class ImageListViewController: UIViewController {
//    
//    private var presenter: IPresenter
//    private var imageListView = ImageListView()
//    private var images: [UIImage] = []
//    
//    init(presenter: IPresenter) {
//        self.presenter = presenter
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    @available(*, unavailable)
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func loadView() {
//        view = imageListView
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupView()
//        setupNavigationBar()
//    }
//    
//    private func setupView() {
//        imageListView.searchBar.delegate = self
//        imageListView.tableView.dataSource = self
//        imageListView.tableView.register(ImageListViewCell.self, forCellReuseIdentifier: ImageListViewCell.identifier)
//    }
//    
//    private func setupNavigationBar() {
//        navigationItem.titleView = imageListView.progressView
//    }
//}
//
//// MARK: - IImageListUI
//
//extension ImageListViewController: IImageListUI {
//    func showImages(_ images: [UIImage]) {
//        self.images = images
//        imageListView.tableView.reloadData()
//        imageListView.progressView.isHidden = true
//    }
//    
//    func showError(_ error: String) {
//        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default))
//        present(alert, animated: true)
//        imageListView.progressView.isHidden = true
//    }
//    
//    func showLoadingProgress(_ progress: Float) {
//        imageListView.progressView.isHidden = false
//        imageListView.progressView.progress = progress
//    }
//}
//
//// MARK: - UISearchBarDelegate
//
//extension ImageListViewController: UISearchBarDelegate {
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        guard let query = searchBar.text, !query.isEmpty else { return }
//        imageListView.progressView.progress = 0
//        imageListView.progressView.isHidden = false
//        presenter.searchImages(for: query)
//    }
//}
//
//// MARK: - UITableViewDataSource
//
//extension ImageListViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return images.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: ImageListViewCell.identifier, for: indexPath) as? ImageListViewCell else {
//            return UITableViewCell()
//        }
//        cell.configure(with: images[indexPath.row])
//        return cell
//    }
//}


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
        setupDefaultNavigationBar()
    }
    
    private func setupView() {
        imageListView.searchBar.delegate = self
        imageListView.tableView.dataSource = self
        imageListView.tableView.register(ImageListViewCell.self, forCellReuseIdentifier: ImageListViewCell.identifier)
    }
    
    func setupDefaultNavigationBar() {
        navigationItem.titleView = nil
        navigationItem.title = "Images"
    }
    
    func changeNavigationBar() {
        navigationItem.titleView = imageListView.progressView
    }
}

// MARK: - IImageListUI

extension ImageListViewController: IImageListUI {
    func showImages(_ images: [UIImage]) {
        self.images = images
        imageListView.tableView.reloadData()
        setupDefaultNavigationBar()
    }
    
    func showError(_ error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
        setupDefaultNavigationBar()
    }
    
    func showLoadingProgress(_ progress: Float) {
        imageListView.progressView.isHidden = false
        imageListView.progressView.progress = progress
        changeNavigationBar()
    }
}

// MARK: - UISearchBarDelegate

extension ImageListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text, !query.isEmpty else { return }
        imageListView.progressView.progress = 0
        imageListView.progressView.isHidden = false
        navigationItem.titleView = imageListView.progressView
        navigationItem.title = nil
        presenter.searchImages(for: query)
    }
}

// MARK: - UITableViewDataSource

extension ImageListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ImageListViewCell.identifier, for: indexPath) as? ImageListViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: images[indexPath.row])
        return cell
    }
}
