//
//  300. Longest Increasing Subsequence.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 23.12.2022.
//

import Foundation

enum LongestIncreasingSubsequence {
    
    class Solution {
        struct Pair: Hashable {
            let index: Int
            let last: Int
        }
        
        var cache: [Pair: Int] = [:]
        
        func lengthOfLIS(_ nums: [Int]) -> Int {
            let maxLength = calc(index: 0, last: Int.min, nums: nums)
            return maxLength
        }
        
        private func calc(index: Int, last: Int, nums: [Int]) -> Int {
            if let value = cache[Pair(index: index, last: last)] {
                return value
            } else {
                if index == nums.count {
                    return nums[nums.count - 1] > last ? 1 : 0
                }
                
                var maxLength = 0
                
                for i in index..<nums.count where nums[i] > last {
                    maxLength = max(maxLength, calc(index: i + 1, last: nums[i], nums: nums) + 1)
                }
                
                cache[Pair(index: index, last: last)] = maxLength
                return maxLength
            }
        }
    }
}

extension LongestIncreasingSubsequence.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [10,9,2,5,3,7,101,18], result: 4, func1: self.lengthOfLIS)
        ]
    }
}
