//
//  1480. Running Sum of 1d Array.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 06.02.2023.
//

import Foundation

enum RunningSumOf1dArray {
    
    class Solution {
        func runningSum(_ nums: [Int]) -> [Int] {
            var array = nums
            
            for i in 1..<nums.count {
                array[i] = array[i] + array[i - 1]
            }
            
            return array
        }
    }
}

extension RunningSumOf1dArray.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [1,2,3,4], result: [1,3,6,10], func1: self.runningSum)
        ]
    }
}
