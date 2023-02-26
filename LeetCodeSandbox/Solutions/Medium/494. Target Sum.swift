//
//  494. Target Sum.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 26.02.2023.
//

import Foundation

enum TargetSum {
    
    class Solution {
        struct Input: Hashable {
            let l: Int
            let target: Int
        }
        
        func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
            var cache: [Input: Int] = [:]
            
            func calc(_ target: Int, _ l: Int) -> Int {
                if l == nums.count - 1 {
                    if target == 0 && nums[l] == 0 {
                        return 2
                    } else {
                        return abs(target) == nums[l] ? 1 : 0
                    }
                } else if let value = cache[Input(l: l, target: target)] {
                    return value
                } else {
                    let result = calc(target + nums[l], l + 1) + calc(target - nums[l], l + 1)
                    cache[Input(l: l, target: target)] = result
                    return result
                }
            }
            
            let result = calc(target, 0)
            return result
        }
    }
}

extension TargetSum.Solution: SolutionProtocol {
    
    var testCases: [Validatable] {
        return [
            TestCase2(input1: [7,9,3,8,0,2,4,8,3,9], input2: 0, result: 0, func2: self.findTargetSumWays),
            TestCase2(input1: [1,0], input2: 1, result: 2, func2: self.findTargetSumWays),
            TestCase2(input1: [1,1,1,1,1], input2: 3, result: 5, func2: self.findTargetSumWays),
            TestCase2(input1: [1], input2: 1, result: 1, func2: self.findTargetSumWays),
        ]
    }
}
