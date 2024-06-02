//
//  ViewController.swift
//  HW7
//
//  Created by Aliia Satbakova  on 29.05.2024.
//

import UIKit

class ViewController: UIViewController, ImageLoaderDelegate {

    let network = ImageLoader()
    var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        
        imageView = UIImageView(frame: CGRect(x: 50, y: 100, width: 300, height: 300))
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .lightGray
        view.addSubview(imageView)
        
        network.delegate = self
        network.loadImageFromURL(query: "cat")
    }

    func didLoadImage(_ image: UIImage) {
        print("Image loaded successfully: \(image)")
        DispatchQueue.main.async {
            self.imageView.image = image
        }
    }

    func didFailWithError(_ error: String) {
        print("Failed with error: \(error)")
    }

    func didUpdateProgress(_ progress: Float) {
        print("Progress: \(progress)")
    }
}
