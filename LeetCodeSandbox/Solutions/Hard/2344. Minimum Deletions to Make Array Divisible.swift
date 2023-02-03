//
//  2344. Minimum Deletions to Make Array Divisible.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 03.02.2023.
//

import Foundation

enum MinimumDeletionsToMakeArrayDivisible {
    
    class Solution {
        func minOperations(_ nums: [Int], _ numsDivide: [Int]) -> Int {
            var divider = numsDivide[0]
            
            for i in 1..<numsDivide.count {
                divider = maxDivider(a: divider, b: numsDivide[i])
            }
            
            let sortedNums = nums.sorted(by: <)
            
            for i in 0..<sortedNums.count {
                if divider % sortedNums[i] == 0 {
                    return i
                }
            }
            
            return -1
        }
        
        func maxDivider(a: Int, b: Int) -> Int {
            var a = a
            var b = b
            
            while a != 0 && b != 0 {
                if a > b {
                    a = a % b
                } else {
                    b = b % a
                }
            }
            
            return a + b
        }
    }
}

extension MinimumDeletionsToMakeArrayDivisible.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase2(
                input1: [3,2,6,2,35,5,35,2,5,8,7,3,4],
                input2: [105,70,70,175,105,105,105],
                result: 6,
                func2: self.minOperations
            ),
//            TestCase2(
//                input1: [2,3,2,4,3],
//                input2: [9,6,9,3,15],
//                result: 2,
//                func2: self.minOperations
//            ),
//            TestCase2(
//                input1: [4,3,6],
//                input2: [8,2,6,10],
//                result: -1,
//                func2: self.minOperations
//            )
        ]
    }
}
