//
//  Randomizeable.swift
//  IColab
//
//  Created by Jeremy Raymond on 04/10/23.
//

import Foundation

protocol Randomizeable {
    associatedtype Element
    
    static var array: [Element] { get set }
    
    static func initArray() -> [Element]
}

extension Randomizeable {
    static func generateArray() -> [Element] {
        var array: [Element] = []
        
        for _ in 0...Int.random(in: 5..<10) {
            array.append(self.array.randomElement()!)
        }
        
        return array
    }
}
