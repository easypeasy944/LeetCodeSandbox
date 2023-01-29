//
//  1051. Height Checker.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 29.01.2023.
//

import Foundation

enum HeightChecker {
    
    class Solution {
        func heightChecker(_ heights: [Int]) -> Int {
            let sortedHeights = heights.sorted(by: <)
            
            var count: Int = 0
            for (a, b) in zip(heights, sortedHeights) {
                if a != b {
                    count += 1
                }
            }
            
            return count
        }
    }
}

extension HeightChecker.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [1,1,4,2,1,3], result: 3, func1: self.heightChecker)
        ]
    }
}
