//
//  2341. Maximum Number of Pairs in Array.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 03.01.2023.
//

import Foundation

enum MaximumNumberOfPairsInArray {
    
    class Solution {
        func numberOfPairs(_ nums: [Int]) -> [Int] {
            var map: [Int: Int] = [:]
            nums.forEach { map[$0, default: 0] += 1 }
            
            var pairsCount: Int = 0
            var leftOverCount: Int = 0
            
            for (_, value) in map {
                pairsCount += value / 2
                leftOverCount += value % 2
            }
            
            return [pairsCount, leftOverCount]
        }
    }
}

extension MaximumNumberOfPairsInArray.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [1,3,2,1,3,2,2], result: [3, 1], func1: self.numberOfPairs),
            TestCase1(input1: [1,1], result: [1, 0], func1: self.numberOfPairs),
            TestCase1(input1: [0], result: [0, 1], func1: self.numberOfPairs),
        ]
    }
}
