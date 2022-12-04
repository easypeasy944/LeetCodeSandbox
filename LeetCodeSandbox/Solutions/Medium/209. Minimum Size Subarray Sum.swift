//
//  209. Minimum Size Subarray Sum.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 04.12.2022.
//

import Foundation

enum MinimumSizeSubarraySum {
    
    class Solution {
        func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
            var result: Int = 0
            
            var leftPointer: Int = 0
            var rightPointer: Int = 0
            
            var sum: Int = 0
            
            while rightPointer <= nums.count - 1 {
                if nums[rightPointer] >= target {
                    result = 1
                }
                
                sum += nums[rightPointer]
                
                while sum >= target && leftPointer != rightPointer && sum - nums[leftPointer] >= target {
                    sum -= nums[leftPointer]
                    leftPointer += 1
                }
                
                if sum >= target {
                    result = result == 0 ? rightPointer - leftPointer + 1 : min(result, rightPointer - leftPointer + 1)
                }
             
                rightPointer += 1
            }
            
            return result
        }
    }
}

extension MinimumSizeSubarraySum.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase2(input1: 7, input2: [2,3,1,2,4,3], result: 2, func2: self.minSubArrayLen),
            TestCase2(input1: 4, input2: [1,4,4], result: 1, func2: self.minSubArrayLen),
            TestCase2(input1: 11, input2: [1,1,1,1,1,1,1,1], result: 0, func2: self.minSubArrayLen),
        ]
    }
}
