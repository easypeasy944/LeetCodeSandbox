//
//  918. Maximum Sum Circular Subarray.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 26.02.2023.
//

import Foundation

enum MaximumSumCircularSubarray {
    
    class Solution {
        func maxSubarraySumCircular(_ nums: [Int]) -> Int {
            var totalSum = 0
            var maxSum = Int.min
            var curMax = 0
            var minSum = Int.max
            var curMin = 0
            
            for x in nums {
                curMax = max(x, curMax + x);  //update the current max subarray sum
                maxSum = max(maxSum, curMax); //update the overall max subarray sum
                curMin = min(x, curMin + x);  //update the current min subarray sum
                minSum = min(minSum, curMin); //update the overall min subarray sum
                totalSum += x
            }
            
            return maxSum > 0 ? max(maxSum, totalSum - minSum) : maxSum
        }
    }
}

extension MaximumSumCircularSubarray.Solution: SolutionProtocol {
    
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [1,-2,3,-2], result: 3, func1: self.maxSubarraySumCircular),
            TestCase1(input1: [5,-3,6], result: 11, func1: self.maxSubarraySumCircular),
        ]
    }
}
