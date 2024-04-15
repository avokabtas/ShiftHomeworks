//
//  MenuFunctions.swift
//  HW1
//
//  Created by Aliia Satbakova  on 13.04.2024.
//

import Foundation

func addNewCar() {
    print(Interface.AddNewCar.title.rawValue)
    
    print(Interface.AddNewCar.manufacturer.rawValue)
    guard let manufacturer = readLine(), !manufacturer.isEmpty else {
        print(ErrorMessage.fieldIsRequired.rawValue)
        return
    }
    
    print(Interface.AddNewCar.model.rawValue)
    guard let model = readLine(), !model.isEmpty else {
        print(ErrorMessage.fieldIsRequired.rawValue)
        return
    }
    
    print(Interface.AddNewCar.body.rawValue)
    Body.allCases.enumerated().forEach { index, body in
        print("\(index + 1). \(body.rawValue)")
    }
    
    guard let inputStringBody = readLine(),
          let bodyIndex = Int(inputStringBody),
          bodyIndex > 0 && bodyIndex <= Body.allCases.count else {
        print(ErrorMessage.incorrectBodyType.rawValue)
        return
    }
    
    let selectedBody = Body.allCases[bodyIndex - 1]
    
    let minYear = 1885
    let currentYear = Calendar.current.component(.year, from: Date())
    
    print(Interface.AddNewCar.yearOfIssue.rawValue)
    guard let inputStringYear = readLine(),
          let yearOfIssue = Int(inputStringYear),
          yearOfIssue >= minYear && yearOfIssue <= currentYear else {
        print(ErrorMessage.incorrectYear.rawValue)
        return
    }
    
    print(Interface.AddNewCar.carNumber.rawValue)
    let carNumber = readLine()
    
    let car = Car(manufacturer: manufacturer,
                  model: model,
                  body: selectedBody,
                  yearOfIssue: yearOfIssue,
                  carNumber: carNumber)
    
    cars.append(car)
    
    print(Interface.AddNewCar.success.rawValue)
}

func printAllCars() {
    if cars.isEmpty {
        print(Interface.AllCars.notFound.rawValue)
        return
    }
    
    print(Interface.AllCars.found.rawValue)
    for (index, car) in cars.enumerated() {
        print("\(index + 1). \(car.manufacturer) \(car.model), Тип кузова: \(car.body.rawValue), Год выпуска: \(car.yearOfIssue != nil ? "\(car.yearOfIssue!)" : "-")")
    }
}

func printAllCarsFiltredByBody() {
    print(Interface.AllCarsFiltredByBody.title.rawValue)
    Body.allCases.enumerated().forEach { index, body in
        print("\(index + 1). \(body.rawValue)")
    }
    
    guard let inputStringBody = readLine(),
          let bodyIndex = Int(inputStringBody),
          bodyIndex > 0 && bodyIndex <= Body.allCases.count else {
        print(ErrorMessage.incorrectBodyType.rawValue)
        return
    }
    
    let selectedBody = Body.allCases[bodyIndex - 1]
    
    let filteredCars = cars.filter { $0.body == selectedBody }
    
    if filteredCars.isEmpty {
        print(Interface.AllCarsFiltredByBody.notFound.rawValue + "'\(selectedBody.rawValue)'.")
        return
    }
    
    print(Interface.AllCarsFiltredByBody.found.rawValue + "'\(selectedBody.rawValue)':")
    for (index, car) in filteredCars.enumerated() {
        print("\(index + 1). \(car.manufacturer) \(car.model), Год выпуска: \(car.yearOfIssue != nil ? "\(car.yearOfIssue!)" : "-")")
    }
}
