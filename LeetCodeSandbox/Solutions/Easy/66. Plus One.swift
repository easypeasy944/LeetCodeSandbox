//
//  66. Plus One.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 21.12.2022.
//

import Foundation

enum PlusOne {
    
    class Solution {
        func plusOne(_ digits: [Int]) -> [Int] {
            var result: [Int] = []
            var carry: Int = 0
            
            for i in (0..<digits.count).reversed() {
                var value = carry + digits[i]
                if i == digits.count - 1 {
                    value += 1
                }
                
                if value >= 10 {
                    carry = value / 10
                    result.insert(value % 10, at: 0)
                } else {
                    carry = 0
                    result.insert(value, at: 0)
                }
            }
            
            if carry != 0 {
                result.insert(carry, at: 0)
            }
            
            return result
        }
    }
}

extension PlusOne.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [1], result: [2], func1: self.plusOne),
            TestCase1(input1: [1,2], result: [1,3], func1: self.plusOne),
            TestCase1(input1: [1,2,9], result: [1,3,0], func1: self.plusOne)
        ]
    }
}
