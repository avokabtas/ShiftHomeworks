//
//  ImageLoader.swift
//  HW7
//
//  Created by Aliia Satbakova  on 31.05.2024.
//

import Foundation
import UIKit.UIImage

final class ImageLoader: NSObject {
    weak var delegate: IImageLoaderDelegate?
    private var dataTask: URLSessionDataTask?
    private var session: URLSession
    private static let cache = NSCache<NSURL, UIImage>()
    private var totalBytesExpected: Int = 0
    private var totalBytesReceived: Int = 0
    
    override init() {
        let configuration = URLSessionConfiguration.default
        self.session = URLSession(configuration: configuration, delegate: nil, delegateQueue: .main)
        super.init()
        self.session = URLSession(configuration: configuration, delegate: self, delegateQueue: .main)
    }
    
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
            totalBytesExpected = 0
            totalBytesReceived = 0
            dataTask = session.dataTask(with: url)
            dataTask?.resume()
        }
    }
}

extension ImageLoader: URLSessionDataDelegate {
    func urlSession(_ session: URLSession, 
                    dataTask: URLSessionDataTask,
                    didReceive response: URLResponse,
                    completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
        totalBytesExpected = Int(response.expectedContentLength)
        totalBytesReceived = 0
        completionHandler(.allow)
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        totalBytesReceived += Int(data.count)
        let progress = Float(totalBytesReceived) / Float(totalBytesExpected)
        delegate?.didUpdateProgress(progress)
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if let error = error {
            delegate?.didFailWithError(error.localizedDescription)
        } else if let url = task.originalRequest?.url {
            let dataTask = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                if let error = error {
                    DispatchQueue.main.async {
                        self?.delegate?.didFailWithError(error.localizedDescription)
                    }
                } else if let data = data, let loadedImage = UIImage(data: data) {
                    ImageLoader.cache.setObject(loadedImage, forKey: url as NSURL)
                    DispatchQueue.main.async {
                        self?.delegate?.didLoadImage(loadedImage)
                    }
                }
            }
            dataTask.resume()
        }
    }
}
