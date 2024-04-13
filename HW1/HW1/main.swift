//
//  main.swift
//  HW1
//
//  Created by Aliia Satbakova  on 12.04.2024.
//

import Foundation

// MARK: - Car

/// Производитель - Обязательное
/// Модель - Обязательное
/// Тип кузова - Обязательное
/// Год выпуска  - Не обязательно
/// Гос. номер - Не обязательно

struct Car {
    var manufacturer: String
    var model: String
    var body: Body
    var yearOfIssue: Int?
    var carNumber: String?
}

// MARK: - Body

enum Body: String, CaseIterable {
    case hatchback = "Хэтчбек"
    case microCompactCar = "Малолитражный автомобиль"
    case stationWagon = "Универсал"
    case van = "Фургон"
    case minivan = "Минивэн"
    case sedan = "Седан"
    case crossover = "Кроссовер"
}

// MARK: - Data

var cars = [Car]()

cars.append(Car(manufacturer: "Mazda", model: "Demio", body: .microCompactCar, yearOfIssue: 2008, carNumber: "A123EF"))
cars.append(Car(manufacturer: "Lexus", model: "RX", body: .crossover, yearOfIssue: nil, carNumber: "X777LS"))
cars.append(Car(manufacturer: "Toyota", model: "Camry", body: .sedan, yearOfIssue: 2023, carNumber: nil))

// MARK: - Основные функции меню

// Добавление авто
func addNewCar() {
    print("Добавление нового автомобиля")
    
    print("Введите производителя:")
    guard let manufacturer = readLine(), !manufacturer.isEmpty else {
        print("Ошибка: производитель не может быть пустым!")
        return
    }
    
    print("Введите модель:")
    guard let model = readLine(), !model.isEmpty else {
        print("Ошибка: модель не может быть пустой!")
        return
    }
    
    print("Выберите тип кузова:")
    Body.allCases.enumerated().forEach { index, body in
        print("\(index + 1). \(body.rawValue)")
    }
    
    guard let inputStringBody = readLine(),
          let bodyIndex = Int(inputStringBody),
          bodyIndex > 0 && bodyIndex <= Body.allCases.count else {
        print("Ошибка: неверный выбор типа кузова!")
        return
    }
    
    let selectedBody = Body.allCases[bodyIndex - 1]
    
    // FIXME:
    
//    print("Введите год выпуска:")
//    let yearOfIssueStr = readLine()
//    let yearOfIssue = Int(yearOfIssueStr ?? "-")
//    
//    guard let yearOfIssueStr = readLine(),
//          let yearOfIssue = Int(yearOfIssueStr),
//          yearOfIssue >= 1885 else {
//        print("Ошибка: год выпуска должен быть целым числом и не меньше 1885!")
//        return
//    }
//    
//    print("Введите гос. номер:")
//    let carNumber = readLine()
//    
//    let car = Car(manufacturer: manufacturer,
//                  model: model,
//                  body: selectedBody,
//                  yearOfIssue: yearOfIssue,
//                  carNumber: carNumber)
//    
//    cars.append(car)
    print("Автомобиль успешно добавлен")
}

// Вывод всех автомобилей
func printAllCars() {
    if cars.isEmpty {
        print("Автомобилей не найдено.")
        return
    }
    
    print("Список всех автомобилей:")
    for (index, car) in cars.enumerated() {
        print("\(index + 1). \(car.manufacturer) \(car.model), Тип кузова: \(car.body.rawValue), Год выпуска: \(car.yearOfIssue != nil ? "\(car.yearOfIssue!)" : "-")")
    }
}

// Вывод всех автомобилей по фильтру кузова
func printAllCarsFiltredByBody() {
    print("Выберите тип кузова:")
    Body.allCases.enumerated().forEach { index, body in
        print("\(index + 1). \(body.rawValue)")
    }
    
    guard let inputStringBody = readLine(),
          let bodyIndex = Int(inputStringBody),
          bodyIndex > 0 && bodyIndex <= Body.allCases.count else {
        print("Ошибка: введите число согласно списку!")
        return
    }
    
    let selectedBody = Body.allCases[bodyIndex - 1]
    
    let filteredCars = cars.filter { $0.body == selectedBody }
    
    if filteredCars.isEmpty {
        print("Автомобилей с типом кузова '\(selectedBody.rawValue)' не найдено.")
        return
    }
    
    print("Список автомобилей с типом кузова '\(selectedBody.rawValue)':")
    for (index, car) in filteredCars.enumerated() {
        print("\(index + 1). \(car.manufacturer) \(car.model), Год выпуска: \(car.yearOfIssue != nil ? "\(car.yearOfIssue!)" : "-")")
    }
}

// MARK: - Меню интерфейса

func menuInterface() {
    print("Выберите действие:")
    print("1. Добавление нового автомобиля")
    print("2. Вывод списка добавленных автомобилей")
    print("3. Вывод списка автомобилей с использованием фильтра по типу кузова автомобиля")
    print("4. Выйти из приложения")
    
    guard let inputString = readLine(), let selectedNumber = Int(inputString) else {
        print("Ошибка: введите число!")
        menuInterface()
        return
    }
    
    switch selectedNumber {
    case 1:
        addNewCar()
    case 2:
        printAllCars()
    case 3:
        printAllCarsFiltredByBody()
    case 4:
        print("Пока-пока!")
        return
    default:
        print("Ошибка: введите число согласно меню с 1 - 4!")
    }
    
    print("-----")
    menuInterface()
}

// MARK: - Старт приложения

func runApp() {
    print("Привет! Это приложение для учета автомобилей.")
    menuInterface()
}

runApp()
