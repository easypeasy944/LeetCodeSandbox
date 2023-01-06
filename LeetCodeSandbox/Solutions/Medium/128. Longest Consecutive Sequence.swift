//
//  128. Longest Consecutive Sequence.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 06.01.2023.
//

import Foundation

enum LongestConsecutiveSequence {
    
    class Solution {
        func longestConsecutive(_ nums: [Int]) -> Int {
            var parentMap: [Int: Int] = [:]
            
            for num in nums {
                if parentMap[num] != nil {
                    continue
                }
                
                parentMap[num] = num
                
                if let child = parentMap[num - 1] {
                    parentMap[child] = num
                }
                if let parent = parentMap[num + 1] {
                    parentMap[num] = parent
                }
            }
            
            var maxValue: Int = 0
            var child: Int = 0
            var parent: Int = 0
            
            for (key, value) in parentMap {
                child = key
                parent = value
                var count: Int = 1
                
                while child != parent {
                    count += parent - child
                    child = parent
                    parent = parentMap[parent]!
                }
                
                parentMap[key] = parent
                maxValue = max(maxValue, count)
            }
            
            return maxValue
        }
    }
}

extension LongestConsecutiveSequence.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [1,2,0,1], result: 3, func1: self.longestConsecutive),
            TestCase1(input1: [100,4,200,1,3,2], result: 4, func1: self.longestConsecutive),
            TestCase1(input1: [0,3,7,2,5,8,4,6,0,1], result: 9, func1: self.longestConsecutive),
        ]
    }
}
