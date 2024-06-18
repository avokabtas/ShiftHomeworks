//
//  ImageListPresenter.swift
//  HW7
//
//  Created by Aliia Satbakova  on 02.06.2024.
//

import Foundation
import UIKit.UIImage

protocol IImageListPresenter: AnyObject {
    func searchImages(for query: String)
    func pauseImageLoad()
    func resumeImageLoad()
}

class ImageListPresenter: IImageListPresenter {
    
    weak var ui: IImageListUI?
    private var imageLoader: ImageLoader
    private var images: [UIImage] = []
    
    init(ui: IImageListUI?, imageLoader: ImageLoader = ImageLoader()) {
        self.ui = ui
        self.imageLoader = imageLoader
        self.imageLoader.delegate = self
    }
    
    func searchImages(for query: String) {
        imageLoader.loadImageFromURL(query: query)
    }
    
    func pauseImageLoad() {
        imageLoader.pauseLoading()
    }
    
    func resumeImageLoad() {
        imageLoader.resumeLoading()
    }
}

extension ImageListPresenter: IImageLoaderDelegate {
    func didLoadImage(_ image: UIImage) {
        images.append(image)
        ui?.showImages(images)
    }

    func didFailWithError(_ error: String) {
        DispatchQueue.main.async {
            self.ui?.showError(error)
        }
    }
    
    func didUpdateProgress(_ progress: Float) {
        DispatchQueue.main.async {
            self.ui?.showLoadingProgress(progress)
        }
    }
}
