//
//  155. Min Stack.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 16.01.2023.
//

import Foundation

enum MinStack {
    
    class MinStack {
        var array: [Int] = []
        var minArray: [Int] = []
        var size: Int = 0
        
        init() {
            
        }
        
        func push(_ val: Int) {
            if array.count == size {
                array.append(0)
                minArray.append(Int.max)
            }
            array[size] = val
            minArray[size] = size == 0 ? val : min(minArray[size - 1], val)
            size += 1
        }
        
        func pop() {
            size = max(size - 1, 0)
        }
        
        func top() -> Int {
            array[size - 1]
        }
        
        func getMin() -> Int {
            minArray[size - 1]
        }
    }
    
    class Solution {
        enum Action: Hashable {
            case initialize
            case push(Int)
            case pop
            case top
            case getMin
        }
        
        enum Result: Hashable {
            case initialize
            case push
            case pop
            case top(Int)
            case getMin(Int)
        }
        
        func run(_ actions: [Action]) -> [Result] {
            var stack: MinStack!
            
            return actions.map {
                switch $0 {
                case .initialize:
                    stack = MinStack()
                    return .initialize
                    
                case .push(let value):
                    stack.push(value)
                    return .push
                    
                case .pop:
                    stack.pop()
                    return .pop
                    
                case .top:
                    return .top(stack.top())
                    
                case .getMin:
                    return .getMin(stack.getMin())
                }
            }
        }
    }
}

extension MinStack.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(
                input1: [
                    .initialize,
                    .push(-2),
                    .push(0),
                    .push(-1),
                    .getMin,
                    .pop,
                    .top,
                    .getMin
                ],
                result: [
                    .initialize,
                    .push,
                    .push,
                    .push,
                    .getMin(-2),
                    .pop,
                    .top(0),
                    .getMin(-2)
                ],
                func1: self.run
            )
        ]
    }
}
