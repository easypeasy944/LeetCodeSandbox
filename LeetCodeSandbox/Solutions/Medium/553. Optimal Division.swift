//
//  553. Optimal Division.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 19.03.2023.
//

import Foundation

enum OptimalDivision {
    class Solution {
        func optimalDivision(_ nums: [Int]) -> String {
            var dp = Array(repeating: Array(repeating: Double(-1), count: nums.count), count: nums.count)
            
            var result = Double(nums[0])
            for i in 1..<nums.count {
                result /= Double(nums[i])
            }
            
            for i in 0..<nums.count {
                dp[i][i] = result
            }
            
            var maxResult: Double = .leastNormalMagnitude
            var l = 0
            var r = 0
            
            for i in 1..<nums.count {
                for j in (i + 1)..<nums.count {
                    dp[i][j] = dp[i][j - 1] * Double(nums[j]) * Double(nums[j])
                    if dp[i][j] > maxResult {
                        l = i
                        r = j
                        maxResult = dp[i][j]
                    }
                }
            }
            
            return formattedResult(nums, l, r)
        }
        
        private func formattedResult(_ nums: [Int], _ l: Int, _ r: Int) -> String {
            var array = nums.map { String($0) }
            
            if l == r {
                return array.joined(separator: "/")
            }
            
            let firstPart = array[0..<l].joined(separator: "/")
            let secondPart = "(" + array[l...r].joined(separator: "/") + ")"
            let thirdPart = array[(r + 1)...].joined(separator: "/")
            return [firstPart, secondPart, thirdPart].filter({ !$0.isEmpty }).joined(separator: "/")
        }
    }
}

extension OptimalDivision.Solution: SolutionProtocol {
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [1000,100,10,2], result: "1000/(100/10/2)", func1: self.optimalDivision),
            TestCase1(input1: [2,3,4], result: "2/(3/4)", func1: self.optimalDivision),
        ]
    }
}
