//
//  961. N-Repeated Element in Size 2N Array.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 08.02.2023.
//

import Foundation

enum NRepeatedElementInSize2NArray {
    
    class Solution {
        func repeatedNTimes(_ nums: [Int]) -> Int {
            for i in 0..<(nums.count - 2) {
                if nums[i] == nums[i + 1] || nums[i] == nums[i + 2] {
                    return nums[i]
                }
            }
            
            return nums[nums.count - 1]
        }
    }
}

extension NRepeatedElementInSize2NArray.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [5,1,5,2,5,3,5,4], result: 5, func1: self.repeatedNTimes),
            TestCase1(input1: [2,1,2,5,3,2], result: 2, func1: self.repeatedNTimes),
            TestCase1(input1: [1,2,3,3], result: 3, func1: self.repeatedNTimes),
        ]
    }
}
