//
//  main.swift
//  HW2
//
//  Created by Aliia Satbakova  on 19.04.2024.
//

import Foundation

func testMethods() {
    let array = ThreadSafeArray<Int>()
    
    for i in 0...10 {
        array.append(i)
    }
    
    // remove
    print("Массив до удаления:")
    for i in 0..<array.count {
        print(i, terminator: " ")
    }
    
    array.remove(at: -1)
    array.remove(at: 0)
    array.remove(at: 1)
    
    print("\nМассив после удаления:")
    for i in 0..<array.count {
        print(i, terminator: " ")
    }
    print()
    
    // contains
    let found = array.contains(5) ? "найден" : "не найден"
    let notFound = array.contains(100) ? "найден" : "не найден"
    print("Элемент 5 \(found) в массиве.")
    print("Элемент 100 \(notFound) в массиве.")
    
    // subscript
    let subsFound = array[2]
    guard let subsFound = subsFound else { return }
    print("Subscript: \(subsFound)")
    
    let subsNotFound = array[10]
    guard let subsNotFound = subsNotFound else { return }
}

func testTreadSafeArray() {
    let safeArray = ThreadSafeArray<Int>()
    
    let queue = DispatchQueue(label: "TestSafeArray", attributes: .concurrent)
    let group = DispatchGroup()
    
    let taskOne = {
        for i in 0...100 {
            safeArray.append(i)
        }
        group.leave()
    }
    
    let taskTwo = {
        for i in 0...200 {
            safeArray.append(i)
        }
        group.leave()
    }
    
    group.enter()
    queue.async { taskOne() }
    
    group.enter()
    queue.async { taskTwo() }
    
    group.wait()
    
    print("Количество элементов в массиве: \(safeArray.count)")
}

func runApp() {
    print("--- Тестирование добавления элементов в массив ---")
    testTreadSafeArray()
    print("--- Тестирование методов ---")
    testMethods()
}

runApp()
