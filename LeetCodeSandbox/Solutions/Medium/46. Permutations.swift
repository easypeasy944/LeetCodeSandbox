//
//  46. Permutations.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 23.08.2022.
//

import Foundation

enum Permutations {
    
    class Solution {
        func permute(_ nums: [Int]) -> [[Int]] {
            var result: [[Int]] = []
            
            for i in 0..<nums.count {
                dfs(array: [nums[i]], indexes: Set([i]), numbers: nums, result: &result)
            }
            
            return result
        }
        
        func dfs(array: [Int], indexes: Set<Int>, numbers: [Int], result: inout [[Int]]) {
            if array.count == numbers.count {
                result.append(array)
            } else {
                for i in 0..<numbers.count {
                    if !indexes.contains(i) {
                        var newArray = array
                        newArray.append(numbers[i])
                        
                        var newIndexes = indexes
                        newIndexes.insert(i)
                        
                        dfs(array: newArray, indexes: newIndexes, numbers: numbers, result: &result)
                    }
                }
            }
        }
    }
}

extension Permutations.Solution: SolutionProtocol {
    var testCases: [Validatable] {
        let comparator: ([[Int]], [[Int]]) -> Bool = { (result1, result2) -> Bool in
            guard result1.count == result2.count else { return false }
            return Set(result1) == Set(result2)
        }
        
        return [
            TestCase1(input1: [1,2,3], result: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]], func1: self.permute, comparator: comparator),
            TestCase1(input1: [1], result: [[1]], func1: self.permute, comparator: comparator),
            TestCase1(input1: [0, 1], result: [[0, 1], [1, 0]], func1: self.permute, comparator: comparator),
        ]
    }
}
