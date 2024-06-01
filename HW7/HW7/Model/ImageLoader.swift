//
//  ImageLoader.swift
//  HW7
//
//  Created by Aliia Satbakova  on 31.05.2024.
//

import Foundation
import UIKit

final class ImageLoader {
    
    private let session = URLSession.shared
    private static let cache = NSCache<NSURL, UIImage>()
    
    func loadImageFromURL() {
        guard let url = APIManager.getImageURL() else { return }
        
        session.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No data received")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response")
                return
            }
            
            if !(200..<300).contains(httpResponse.statusCode) {
                print("Unexpected status code: \(httpResponse.statusCode)")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let photo = try decoder.decode(Photo.self, from: data)
                self.fetchImage(from: photo.urls.regular)
            } catch {
                print("Error parsing JSON: \(error.localizedDescription)")
            }
            
        }.resume()
    }
    
    private func fetchImage(from urlJSON: String) {
        guard let url = URL(string: urlJSON) else { return }
        
        // Сначала проверяем наличие закэшированного изображения в NSCache
        if let cachedImage = ImageLoader.cache.object(forKey: url as NSURL) {
            DispatchQueue.main.async {
                // Тут надо подумать как сделать
                //self.image = cachedImage
            }
        } else {
            // И только потом отправляем запрос на загрузку изображения в случае отсутствия кэша
            session.dataTask(with: url) { data, response, error in
                guard let data = data, let loadedImage = UIImage(data: data) else {
                    print("Error fetching image data")
                    return
                }
                // Сохраняем загруженное изображение в NSCache
                ImageLoader.cache.setObject(loadedImage, forKey: url as NSURL)
                DispatchQueue.main.async {
                    // Тут надо подумать как сделать
                   // self.image = loadedImage
                }
            }.resume()
        }
        
    }
    
}
