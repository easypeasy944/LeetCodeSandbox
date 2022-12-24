//
//  284. Peeking Iterator.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 24.12.2022.
//

import Foundation

enum PeekingIterator {
    
    class PeekingIterator {
        private var cachedValue: Int?
        private var iterator: IndexingIterator<Array<Int>>
        
        init(_ arr: IndexingIterator<Array<Int>>) {
            self.iterator = arr
        }
        
        func next() -> Int {
            if let cachedValue = cachedValue {
                defer { self.cachedValue = iterator.next() }
                return cachedValue
            } else {
                defer { self.cachedValue = iterator.next() }
                return iterator.next()!
            }
        }
        
        func peek() -> Int {
            if cachedValue == nil {
                cachedValue = iterator.next()
            }
            return cachedValue!
        }
        
        func hasNext() -> Bool {
            if cachedValue == nil {
                cachedValue = iterator.next()
            }
            return cachedValue != nil
        }
    }
    
    class Solution {
     
        enum Action {
            case peek
            case next
            case hasNext
        }
        
        enum Result: Equatable {
            case intResult(Int?)
            case boolResult(Bool)
        }
        
        func run(_ array: [Int], _ actions: [Action]) -> [Result] {
            let iterator = PeekingIterator(array.makeIterator())
            
            let result: [Result] = actions.map {
                switch $0 {
                case .next:
                    return .intResult(iterator.next())
                case .hasNext:
                    return .boolResult(iterator.hasNext())
                case .peek:
                    return .intResult(iterator.peek())
                }
            }
            
            return result
        }
    }
}

extension PeekingIterator.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase2(
                input1: [1,2,3],
                input2: [
                    .next,
                    .peek,
                    .next,
                    .next,
                    .hasNext
                ],
                result: [
                    .intResult(1),
                    .intResult(2),
                    .intResult(2),
                    .intResult(3),
                    .boolResult(false)
                ],
                func2: self.run
            )
        ]
    }
}
