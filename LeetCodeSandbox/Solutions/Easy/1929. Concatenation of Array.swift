//
//  1929. Concatenation of Array.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 04.02.2023.
//

import Foundation

enum ConcatenationOfArray {
    
    class Solution {
        func getConcatenation(_ nums: [Int]) -> [Int] {
            var ans = Array(repeating: 0, count: 2 * nums.count)
            
            for i in 0..<nums.count {
                ans[i] = nums[i]
                ans[i + nums.count] = nums[i]
            }
            
            return ans
        }
    }
}

extension ConcatenationOfArray.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [1,2,1], result: [1,2,1,1,2,1], func1: self.getConcatenation)
        ]
    }
}
