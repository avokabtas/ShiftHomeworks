//
//  Interface.swift
//  HW1
//
//  Created by Aliia Satbakova  on 13.04.2024.
//

import Foundation

enum Interface {
    enum MainInterface : String {
        case helloMessage = "Привет! Это приложение для учета автомобилей."
        case title = "Выберите действие:"
        case addNewCar = "1. Добавление нового автомобиля"
        case listOfCars = "2. Вывод списка добавленных автомобилей"
        case listOfCarsByFilter = "3. Вывод списка автомобилей с использованием фильтра по типу кузова автомобиля"
        case exitApp = "4. Выйти из приложения"
        case exitMessage = "Пока-пока!"
        case separator = "------"
    }
    
    enum AddNewCar : String {
        case title = "Добавление нового автомобиля:"
        case manufacturer = "Введите производителя:"
        case model = "Введите модель:"
        case body = "Выберите тип кузова:"
        case yearOfIssue = "Введите год выпуска:"
        case carNumber = "Введите гос. номер:"
        case success = "Автомобиль успешно добавлен."
    }
    
    enum AllCars : String {
        case notFound = "Автомобилей не найдено."
        case found = "Список всех автомобилей:"
    }
    
    enum AllCarsFiltredByBody : String {
        case title = "Выберите тип кузова:"
        case notFound = "Не найдено автомобилей с типом кузова "
        case found = "Список автомобилей c типом кузова "
    }
}
