//
//  2155. All Divisions With the Highest Score of a Binary Array.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 20.01.2023.
//

import Foundation

enum AllDivisionsWithTheHighestScoreOfABinaryArray {
    
    class Solution {
        func maxScoreIndices(_ nums: [Int]) -> [Int] {
            var zeroes = Array(repeating: 0, count: nums.count + 1)
            
            var count: Int = 0
            for i in 0...nums.count {
                zeroes[i] = count
                
                if i < nums.count && nums[i] == 0 {
                    count += 1
                }
            }
            
            count = 0
            var max = Int.min
            var indexes: [Int] = []
            
            for i in (0...nums.count).reversed() {
                if i < nums.count && nums[i] == 1 {
                    count += 1
                }
                
                let currentSum = count + zeroes[i]
                if currentSum == max {
                    indexes.append(i)
                } else if currentSum > max {
                    indexes.removeAll(keepingCapacity: true)
                    indexes.append(i)
                    max = currentSum
                }
            }
            
            return indexes
        }
    }
}

extension AllDivisionsWithTheHighestScoreOfABinaryArray.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [0,0,1,0], result: [4,2], func1: self.maxScoreIndices),
            TestCase1(input1: [0,0,0], result: [3], func1: self.maxScoreIndices),
        ]
    }
}
