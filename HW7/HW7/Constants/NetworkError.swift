//
//  NetworkError.swift
//  HW7
//
//  Created by Aliia Satbakova  on 03.06.2024.
//

import Foundation

enum NetworkError: String, Error {
    case invalidURL = "Invalid URL!"
    case invalidResponse = "Invalid response!"
    case invalidJSON = "Error parsing JSON!"
    case invalidFetchingData = "Error fetching image data!"
}
