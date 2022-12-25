//
//  2357. Make Array Zero by Subtracting Equal Amounts.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 25.12.2022.
//

import Foundation

enum MakeArrayZeroBySubtractingEqualAmounts {
    
    class Solution {
        func minimumOperations(_ nums: [Int]) -> Int {
            let sortedNums = nums.sorted(by: <)
            var current: Int?
            var count: Int = 0
            
            for num in sortedNums {
                if num == 0 {
                    continue
                }
                
                if current == nil {
                    current = num
                } else if num != current {
                    count += 1
                    current = num
                }
            }
            
            if count == 0 && current == nil {
                return 0
            } else if count == 0 && current != nil {
                return 1
            } else {
                return count + 1
            }
        }
    }
}

extension MakeArrayZeroBySubtractingEqualAmounts.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [1,5,0,3,5], result: 3, func1: self.minimumOperations),
            TestCase1(input1: [0], result: 0, func1: self.minimumOperations),
            TestCase1(input1: [5], result: 1, func1: self.minimumOperations),
            TestCase1(input1: [0,0,0,0,5], result: 1, func1: self.minimumOperations),
        ]
    }
}
