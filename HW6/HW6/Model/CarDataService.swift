//
//  CarDataService.swift
//  HW6
//
//  Created by Aliia Satbakova  on 27.05.2024.
//

import Foundation

class CarDataService {
    static let shared = CarDataService()
    
    private init() {}
    
    func fetchCars() -> [Car] {
        guard let path = Bundle.main.path(forResource: "Cars", ofType: "json") else {
            fatalError("File not found!")
        }
        
        let url = URL(filePath: path)
        let decoder = JSONDecoder()
        
        do {
            let data = try Data(contentsOf: url)
            let carsData = try decoder.decode([String: [Car]].self, from: data)
            return carsData["cars"] ?? []
        } catch {
            fatalError("Error parsing JSON: \(error)")
        }
    }
}
