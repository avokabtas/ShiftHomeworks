//
//  MenuInterface.swift
//  HW1
//
//  Created by Aliia Satbakova  on 13.04.2024.
//

import Foundation

func menuInterface() {
    print(Interface.MainInterface.title.rawValue)
    print(Interface.MainInterface.addNewCar.rawValue)
    print(Interface.MainInterface.listOfCars.rawValue)
    print(Interface.MainInterface.listOfCarsByFilter.rawValue)
    print(Interface.MainInterface.exitApp.rawValue)
    
    guard let inputString = readLine(), let selectedNumber = Int(inputString) else {
        print(ErrorMessage.enterNumber.rawValue)
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
        print(Interface.MainInterface.exitMessage.rawValue)
        return
    default:
        print(ErrorMessage.menuNumber.rawValue)
    }
    
    print(Interface.MainInterface.separator.rawValue)
    
    menuInterface()
}
