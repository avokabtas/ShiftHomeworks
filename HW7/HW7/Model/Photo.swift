//
//  Photo.swift
//  HW7
//
//  Created by Aliia Satbakova  on 31.05.2024.
//

import Foundation

struct Photo: Decodable {
    let urls: Urls
    
    struct Urls: Decodable {
        let small: String
    }
}
