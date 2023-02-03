//
//  413. Arithmetic Slices.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 03.02.2023.
//

import Foundation

enum ArithmeticSlices {
    
    class Solution {
        func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
            var count: Int = 0
            
            var diff = 0
            var startIndex = 0
            
            for i in 0..<nums.count {
                if i == 0 {
                    continue
                } else if i == nums.count - 1 {
                    if nums[i] - nums[i - 1] == diff && i - startIndex >= 2 {
                        count += calc(length: i - startIndex + 1)
                    }
                } else {
                    if nums[i] - nums[i - 1] == diff {
                        if startIndex == -1 {
                            startIndex = i - 1
                        }
                    } else {
                        if i - startIndex >= 2 {
                            count += calc(length: i - startIndex)
                        }
                        
                        diff = nums[i] - nums[i - 1]
                        startIndex = i - 1
                    }
                }
            }
            
            return count
        }
        
        func calc(length: Int) -> Int {
            return (length - 1) * (length - 2) / 2
        }
    }
}

extension ArithmeticSlices.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [1,2,3,4], result: 3, func1: self.numberOfArithmeticSlices)
        ]
    }
}
