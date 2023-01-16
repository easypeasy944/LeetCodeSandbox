//
//  Stack.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 16.01.2023.
//

import Foundation

struct Stack<T> {
    private var array: [T] = []
    private var size: Int = 0
    
    mutating func push(_ value: T) {
        if array.count == size {
            array.append(value)
        } else {
            array[size] = value
        }
        size += 1
    }
    
    func top() -> T? {
        guard size > 0 else { return nil }
        return array[size - 1]
    }
    
    mutating func pop() -> T? {
        guard size > 0 else { return nil }
        let value = array[size - 1]
        size -= 1
        return value
    }
}
