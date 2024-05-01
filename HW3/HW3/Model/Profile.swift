//
//  Profile.swift
//  HW3
//
//  Created by Aliia Satbakova  on 29.04.2024.
//

import Foundation

struct Profile {
    let name: String
    let age: String
    let education: String
    let cityOfResidence: String
    let hometown: String
    let photo: String
    
    private static let defaultNameTitle = "Имя:"
    private static let defaultAgeTitle = "Возраст:"
    private static let defaultEducationTitle = "Образование:"
    private static let defaultCityOfResidenceTitle = "Город проживания:"
    private static let defaultHometownTitle = "Родной город:"
    
    init(name: String, age: String, education: String, cityOfResidence: String, hometown: String, photo: String) {
        self.name = "\(Profile.defaultNameTitle) \(name)"
        self.age = "\(Profile.defaultAgeTitle) \(age)"
        self.education = "\(Profile.defaultEducationTitle) \(education)"
        self.cityOfResidence = "\(Profile.defaultCityOfResidenceTitle) \(cityOfResidence)"
        self.hometown = "\(Profile.defaultHometownTitle) \(hometown)"
        self.photo = photo
    }
}
