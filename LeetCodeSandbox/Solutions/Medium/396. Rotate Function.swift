//
//  396. Rotate Function.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 25.01.2023.
//

import Foundation

enum RotateFunction {
    
    class Solution {
        func maxRotateFunction(_ nums: [Int]) -> Int {
            var baseSum: Int = 0
            for i in 0..<nums.count {
                baseSum += i * nums[i]
            }
            
            let all = nums.reduce(0, +)
            var maxSum = baseSum
            
            for i in (1..<nums.count).reversed() {
                baseSum = baseSum + all - nums.count * nums[i]
                maxSum = max(baseSum, maxSum)
            }
            
            return maxSum
        }
    }
}

extension RotateFunction.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [4,3,2,6], result: 26, func1: self.maxRotateFunction),
            TestCase1(input1: [100], result: 0, func1: self.maxRotateFunction),
        ]
    }
}
