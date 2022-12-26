//
//  1968. Array With Elements Not Equal to Average of Neighbors.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 25.12.2022.
//

import Foundation

enum ArrayWithElementsNotEqualToAverageOfNeighbors {
    
    class Solution {
        func rearrangeArray(_ nums: [Int]) -> [Int] {
            let sortedArray = nums.sorted(by: >)
            var result = Array(repeating: 0, count: nums.count)
            
            var i: Int = 0
            var j: Int = 0
            
            while j < sortedArray.count {
                result[j] = sortedArray[i]
                i += 1
                j += 2
            }
            
            j = 1
            
            while j < sortedArray.count {
                result[j] = sortedArray[i]
                i += 1
                j += 2
            }
            
            return result
        }
    }
}

extension ArrayWithElementsNotEqualToAverageOfNeighbors.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        let comparator: ([Int], [Int]) -> Bool = { lhs, rhs in
            for i in 1...(lhs.count - 2) {
                if (lhs[i - 1] + lhs[i + 1]) == lhs[i] {
                    return false
                }
            }
            return true
        }
        
        return [
            TestCase1(input1: [1,2,3], result: [], func1: self.rearrangeArray, comparator: comparator),
            TestCase1(input1: [6,2,0,9,7], result: [], func1: self.rearrangeArray, comparator: comparator),
            TestCase1(input1: [1,2,3,4,5,6,7,8,9,11,15,17], result: [], func1: self.rearrangeArray, comparator: comparator),
        ]
    }
}
