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
    
    //    // TODO: Все работает и грузится, надо сделать UI
    //    // - отдельно в ImageListView() ✅
    //    // - кастомная ячейка ✅
    //    // - многопоточность, когда вводишь неверный запрос а-ля "аарыф" - должна быть ошибка, сейчас краш ✅
    //    // - прогресс вью
    
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
        setupSearchBarView()
        setupTableView()
    }
    
    private func setupSearchBarView() {
        imageListView.searchBar.delegate = self
    }
    
    private func setupTableView() {
        imageListView.tableView.dataSource = self
        imageListView.tableView.register(ImageListViewCell.self, forCellReuseIdentifier: ImageListViewCell.identifier)
    }
}

// MARK: - IImageListUI

extension ImageListViewController: IImageListUI {
    func showImages(_ images: [UIImage]) {
        self.images = images
        imageListView.tableView.reloadData()
    }
    
    func showError(_ error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    func showLoadingProgress(_ progress: Float) {
        print("Loading progress: \(progress)")
    }
}

// MARK: - UISearchBarDelegate

extension ImageListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text, !query.isEmpty else { return }
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
