//
//  15. 3Sum.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 23.08.2022.
//

import Foundation

enum ThreeSum {
    
    class Solution {
        func threeSum(_ nums: [Int]) -> [[Int]] {
            
            return []
        }
    }
}

extension ThreeSum.Solution: SolutionProtocol {
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [-1,0,1,2,-1,-4], result: [[-1,-1,2],[-1,0,1]], func1: self.threeSum),
        ]
    }
}
