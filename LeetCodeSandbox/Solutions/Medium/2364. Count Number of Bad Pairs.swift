//
//  2364. Count Number of Bad Pairs.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 19.01.2023.
//

import Foundation

enum CountNumberOfBadPairs {
    
    class Solution {
        func countBadPairs(_ nums: [Int]) -> Int {
            var map: [Int: Int] = [:]
            var count: Int = 0
            
            for i in 0..<nums.count {
                let prevCount = map[i - nums[i], default: 0]
                count += prevCount
                map[i - nums[i], default: 0] = prevCount + 1
            }
            
            return (nums.count - 1) * nums.count / 2 - count
        }
    }
}

extension CountNumberOfBadPairs.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [4,1,3,3], result: 5, func1: self.countBadPairs)
        ]
    }
}
