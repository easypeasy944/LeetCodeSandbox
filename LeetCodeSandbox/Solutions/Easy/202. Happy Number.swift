//
//  202. Happy Number.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 07.01.2023.
//

import Foundation

enum HappyNumber {
    
    class Solution {
        func isHappy(_ n: Int) -> Bool {
            var set = Set<Int>([n])
            var value = n
            
            while true {
                let sum = self.sum(value)
                if sum == 1 {
                    return true
                } else if set.contains(sum) {
                    return false
                } else {
                    set.insert(sum)
                }
                value = sum
            }
        }
        
        private func sum(_ n: Int) -> Int {
            var result: Int = 0
            var value = n
            
            while value > 9 {
                let divider = value % 10
                result += divider * divider
                value /= 10
            }
            
            result += value * value
            return result
        }
    }
}

extension HappyNumber.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: 19, result: true, func1: self.isHappy),
            TestCase1(input1: 2, result: false, func1: self.isHappy),
        ]
    }
}
