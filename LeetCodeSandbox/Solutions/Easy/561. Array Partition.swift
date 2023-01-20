//
//  561. Array Partition.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 20.01.2023.
//

import Foundation

enum ArrayPartition {
    
    class Solution {
        func arrayPairSum(_ nums: [Int]) -> Int {
            var sortedNums = nums.sorted(by: <)
            var sum: Int = 0
            
            for i in 0..<(nums.count/2) {
                sum += sortedNums[2 * i]
            }
            
            return sum
        }
    }
}

extension ArrayPartition.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [6,2,6,5,1,2], result: 9, func1: self.arrayPairSum)
        ]
    }
}
