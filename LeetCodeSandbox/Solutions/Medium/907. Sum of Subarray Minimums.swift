//
//  907. Sum of Subarray Minimums.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 12.02.2023.
//

import Foundation

enum SumOfSubarrayMinimums {
    
    class Solution {
        func sumSubarrayMins(_ arr: [Int]) -> Int {
            var nums = arr
            var sum = 0
            var count = nums.count
            
            while count > 0 {
                for i in 0..<(count - 1) {
                    sum += nums[i]
                    nums[i] = min(nums[i], nums[i + 1])
                }
                
                sum += nums[count - 1]
                count -= 1
            }
            
            return sum % (1_000_000_007)
        }
    }
}

extension SumOfSubarrayMinimums.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [3,1,2,4], result: 17, func1: self.sumSubarrayMins),
            TestCase1(input1: [11,81,94,43,3], result: 444, func1: self.sumSubarrayMins),
        ]
    }
}
