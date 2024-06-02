//
//  APIManager.swift
//  HW7
//
//  Created by Aliia Satbakova  on 31.05.2024.
//

import Foundation

struct APIManager {
    private static let accessKey = "8bV0i2CoWmqgSMjcVojM1ZW4il-Sb2DSHZS7KohRsm4"
    
    static func getURL(with query: String) -> URL? {
        let urlString = "https://api.unsplash.com/photos/random?query=\(query)&client_id=\(accessKey)"
        return URL(string: urlString)
    }
}
