//
//  525. Contiguous Array.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 16.01.2023.
//

import Foundation

enum ContiguousArray {
    
    class Solution {
        func findMaxLength(_ nums: [Int]) -> Int {
            var map: [Int: (min: Int, max: Int)] = [:]
            map[0] = (-1, -1)
            
            var sum: Int = 0
            
            for i in 0..<nums.count {
                sum += nums[i] == 0 ? -1 : 1
                
                let (minIndex, maxIndex) = map[sum, default: (min: Int.max, max: Int.min)]
                let newMin = min(minIndex, i)
                let newMax = max(maxIndex, i)
                
                map[sum] = (newMin, newMax)
            }
            
            var maxLength: Int = 0
            
            for (_, (minIndex, maxIndex)) in map {
                maxLength = max(maxLength, maxIndex - minIndex)
            }
            
            return maxLength
        }
    }
}

extension ContiguousArray.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [0,1], result: 2, func1: self.findMaxLength),
            TestCase1(input1: [0,1,0], result: 2, func1: self.findMaxLength),
            TestCase1(input1: [1,0,1,0,1,1,0,1,0,1], result: 8, func1: self.findMaxLength),
        ]
    }
}
