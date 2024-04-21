//
//  IThreadSafeArray.swift
//  HW2
//
//  Created by Aliia Satbakova  on 20.04.2024.
//

import Foundation

protocol IThreadSafeArray {
    associatedtype T: Equatable
    
    var isEmpty: Bool { get }
    var count: Int { get }
    
    func append(_ item: T)
    func remove(at index: Int)
    subscript(index: Int) -> T { get }
    func contains(_ element: T) -> Bool
}
