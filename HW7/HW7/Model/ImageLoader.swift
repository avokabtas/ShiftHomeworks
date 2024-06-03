//
//  ImageLoader.swift
//  HW7
//
//  Created by Aliia Satbakova  on 31.05.2024.
//

import Foundation
import UIKit.UIImage

final class ImageLoader {
    weak var delegate: IImageLoaderDelegate?
    private var dataTask: URLSessionDataTask?
    private let session = URLSession.shared
    private static let cache = NSCache<NSURL, UIImage>()
    
    func loadImageFromURL(query: String) {
        guard let url = APIManager.getURL(with: query) else {
            DispatchQueue.main.async {
                self.delegate?.didFailWithError(NetworkError.invalidURL.rawValue)
            }
            return
        }
        
        dataTask = session.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self?.delegate?.didFailWithError(error.localizedDescription)
                }
                return
            }
            
            guard let data = data, let httpResponse = response as? HTTPURLResponse,
                  (200..<300).contains(httpResponse.statusCode) else {
                DispatchQueue.main.async {
                    self?.delegate?.didFailWithError(NetworkError.invalidResponse.rawValue)
                }
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let photo = try decoder.decode(Photo.self, from: data)
                self?.fetchImage(from: photo.urls.small)
            } catch {
                DispatchQueue.main.async {
                    self?.delegate?.didFailWithError(NetworkError.invalidJSON.rawValue)
                }
            }
        }
        dataTask?.resume()
    }
    
    func pauseLoading() {
        dataTask?.suspend()
    }
    
    func resumeLoading() {
        dataTask?.resume()
    }
    
    private func fetchImage(from urlJSON: String) {
        guard let url = URL(string: urlJSON) else {
            DispatchQueue.main.async {
                self.delegate?.didFailWithError(NetworkError.invalidURL.rawValue)
            }
            return
        }

        if let cachedImage = ImageLoader.cache.object(forKey: url as NSURL) {
            DispatchQueue.main.async {
                self.delegate?.didLoadImage(cachedImage)
            }
        } else {
            let task = session.dataTask(with: url) { [weak self] data, response, error in
                if let error = error {
                    DispatchQueue.main.async {
                        self?.delegate?.didFailWithError(error.localizedDescription)
                    }
                    return
                }
                
                guard let data = data, let loadedImage = UIImage(data: data) else {
                    DispatchQueue.main.async {
                        self?.delegate?.didFailWithError(NetworkError.invalidFetchingData.rawValue)
                    }
                    return
                }
                
                ImageLoader.cache.setObject(loadedImage, forKey: url as NSURL)
                DispatchQueue.main.async {
                    self?.delegate?.didLoadImage(loadedImage)
                }
            }
            task.resume()
        }
    }
}
