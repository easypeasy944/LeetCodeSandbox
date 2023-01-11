//
//  1920. Build Array from Permutation.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 11.01.2023.
//

import Foundation

enum BuildArrayFromPermutation {
    
    class Solution {
        func buildArray(_ nums: [Int]) -> [Int] {
            var ans: [Int] = Array(repeating: 0, count: nums.count)
            
            for i in 0..<nums.count {
                ans[i] = nums[nums[i]]
            }
            
            return ans
        }
    }
}

extension BuildArrayFromPermutation.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [0,2,1,5,3,4], result: [0,1,2,4,5,3], func1: self.buildArray),
            TestCase1(input1: [5,0,1,2,3,4], result: [4,5,0,1,2,3], func1: self.buildArray)
        ]
    }
}
