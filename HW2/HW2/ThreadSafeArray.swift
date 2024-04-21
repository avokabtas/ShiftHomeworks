//
//  ThreadSafeArray.swift
//  HW2
//
//  Created by Aliia Satbakova  on 20.04.2024.
//

import Foundation

final class ThreadSafeArray<T: Equatable>: IThreadSafeArray {
    
    // MARK: - Private properties
    
    private var array = [T]()
    private let queue = DispatchQueue(label: "SafeArrayQueue", attributes: .concurrent)
    
    // MARK: - Properties
    
    /// Если массив пуст, возвращает true
    var isEmpty: Bool {
        queue.sync {
            self.array.isEmpty
        }
    }
    
    /// Возвращает количество элементов в массиве
    var count: Int {
        queue.sync {
            self.array.count
        }
    }
    
    // MARK: - Public methods
    
    /// Добавляет новый элемент
    func append(_ item: T) {
        queue.async(flags: .barrier) {
            self.array.append(item)
        }
    }
    
    /// Удаляет элемент с указанным индексом
    func remove(at index: Int) {
        queue.async(flags: .barrier) {
            guard !self.array.isEmpty && index >= 0 && index < self.array.count else {
                print("Ошибка: Индекс выходит за пределы массива!")
                return
            }
            self.array.remove(at: index)
        }
    }
    
    /// Возвращает элемент с указанным индексом
    subscript(index: Int) -> T {
        queue.sync {
            self.array[index]
        }
    }
    
    /// Метод проверки наличия элемента в коллекции. Возвращает true при наличии элемента в коллекции
    func contains(_ element: T) -> Bool {
        var containsElement = false
        queue.sync {
            containsElement = self.array.contains { $0 == element }
        }
        return containsElement
    }
}
