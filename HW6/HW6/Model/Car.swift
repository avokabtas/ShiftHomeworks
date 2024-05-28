//
//  Car.swift
//  HW6
//
//  Created by Aliia Satbakova  on 27.05.2024.
//

import Foundation

struct Car: Decodable {
    let brand: String
    let bodyTypes: [String: BodyType]
}

struct BodyType: Decodable {
    let price: String
    let photo: String
}
