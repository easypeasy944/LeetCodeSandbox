//
//  414. Third Maximum Number.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 21.01.2023.
//

import Foundation

enum ThirdMaximumNumber {
    
    class Solution {
        func thirdMax(_ nums: [Int]) -> Int {
            var a: Int = .min
            var b: Int = .min
            var c: Int = .min
            
            for num in nums {
                if num > a {
                    c = b
                    b = a
                    a = num
                } else if num > b {
                    if num != a {
                        c = b
                        b = num
                    }
                } else if num > c {
                    if num != b {
                        c = num
                    }
                }
            }
            
            if c == Int.min {
                return a
            } else {
                return c
            }
        }
    }
}

extension ThirdMaximumNumber.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [3,2,1], result: 1, func1: self.thirdMax),
            TestCase1(input1: [1,2], result: 2, func1: self.thirdMax),
            TestCase1(input1: [2,2,3,1], result: 1, func1: self.thirdMax),
            TestCase1(input1: [1,1,1,1,1], result: 1, func1: self.thirdMax),
        ]
    }
}
