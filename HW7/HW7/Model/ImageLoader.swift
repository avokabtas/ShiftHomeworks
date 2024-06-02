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
    
    // TODO: Убрать Debug принты
    
    func loadImageFromURL(query: String) {
        guard let url = APIManager.getURL(with: query) else {
            delegate?.didFailWithError("Invalid URL")
            return
        }
        
        print("URL: \(url.absoluteString)") // Debug
        
        dataTask = session.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                self?.delegate?.didFailWithError(error.localizedDescription)
                return
            }
            
            guard let data = data, let httpResponse = response as? HTTPURLResponse,
                  (200..<300).contains(httpResponse.statusCode) else {
                self?.delegate?.didFailWithError("Invalid response")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let photo = try decoder.decode(Photo.self, from: data)
                print("Photo JSON decoded successfully: \(photo)") // Debug
                self?.fetchImage(from: photo.urls.small)
            } catch {
                self?.delegate?.didFailWithError("Error parsing JSON: \(error.localizedDescription)")
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
            delegate?.didFailWithError("Invalid image URL")
            return
        }
        print("Image URL: \(url.absoluteString)") // Debug
        
        // Сначала проверяем наличие закэшированного изображения в NSCache
        if let cachedImage = ImageLoader.cache.object(forKey: url as NSURL) {
            print("Using cached image") // Debug output
            DispatchQueue.main.async {
                self.delegate?.didLoadImage(cachedImage)
            }
        } else {
            // И только потом отправляем запрос на загрузку изображения в случае отсутствия кэша
            let task = session.dataTask(with: url) { [weak self] data, response, error in
                
                if let error = error {
                    print("Error fetching image: \(error.localizedDescription)") // Debug
                    self?.delegate?.didFailWithError(error.localizedDescription)
                    return
                }
                
                guard let data = data, let loadedImage = UIImage(data: data) else {
                    print("No image data") // Debug
                    print("Unable to create image from data") // Debug
                    self?.delegate?.didFailWithError("Error fetching image data")
                    return
                }
                
                // Сохраняем загруженное изображение в NSCache
                ImageLoader.cache.setObject(loadedImage, forKey: url as NSURL)
                
                print("Image loaded and cached") // Debug
                DispatchQueue.main.async {
                    self?.delegate?.didLoadImage(loadedImage)
                }
            }
            task.resume()
        }
    }
}
