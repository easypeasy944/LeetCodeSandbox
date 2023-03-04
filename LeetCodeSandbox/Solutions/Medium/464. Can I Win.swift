//
//  464. Can I Win.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 04.03.2023.
//

import Foundation

enum CanIWin {
    
    class Solution {
        func canIWin(_ maxChoosableInteger: Int, _ desiredTotal: Int) -> Bool {
            guard (1...maxChoosableInteger).reduce(0, +) >= desiredTotal else {
                return false
            }
            
            var cache: [Int32: Bool] = [:]
            
            func canIWin(_ flags: Int32) -> Bool {
                if let value = cache[flags] {
                    return value
                }
                
                var result = false
                
                for i in 1...maxChoosableInteger {
                    if !isUsed(flags, at: i) {
                        let sum = self.sum(for: flags, maxChoosableInteger: maxChoosableInteger)
                        if sum + i >= desiredTotal {
                            result = true
                            break
                        } else {
                            let newFlags = flipBit(flags, at: i)
                            if !canIWin(newFlags) {
                                result = true
                                break
                            }
                        }
                    }
                }
                
                cache[flags] = result
                return result
            }
            
            let canWin = canIWin(0)
            return canWin
        }
        
        func isUsed(_ number: Int32, at index: Int) -> Bool {
            number & (1 << index) == (1 << index)
        }
        
        func flipBit(_ number: Int32, at index: Int) -> Int32 {
            number ^ (1 << index)
        }
        
        func sum(for flags: Int32, maxChoosableInteger: Int) -> Int {
            var sum = 0
            for i in 1...maxChoosableInteger {
                if isUsed(flags, at: i) {
                    sum += i
                }
            }
            
            return sum
        }
    }
}

extension CanIWin.Solution: SolutionProtocol {
    
    var testCases: [Validatable] {
        return [
            TestCase2(input1: 10, input2: 11, result: false, func2: self.canIWin),
            TestCase2(input1: 5, input2: 50, result: false, func2: self.canIWin),
        ]
    }
}
