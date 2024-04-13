//
//  main.swift
//  HW1
//
//  Created by Aliia Satbakova  on 12.04.2024.
//

import Foundation

// MARK: - Data

var cars = [Car]()

cars.append(Car(manufacturer: "Mazda", model: "Demio", body: .microCompactCar, yearOfIssue: 2008, carNumber: "A123EF"))
cars.append(Car(manufacturer: "Lexus", model: "RX", body: .crossover, yearOfIssue: nil, carNumber: "X777LS"))
cars.append(Car(manufacturer: "Toyota", model: "Camry", body: .sedan, yearOfIssue: 2023, carNumber: nil))

// MARK: - Старт приложения

func runApp() {
    print(Interface.MainInterface.helloMessage.rawValue)
    menuInterface()
}

runApp()
