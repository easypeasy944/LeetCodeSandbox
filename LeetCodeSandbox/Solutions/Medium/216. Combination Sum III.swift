//
//  216. Combination Sum III.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 14.01.2023.
//

import Foundation

enum CombinationSumIII {
    
    class Solution {
        func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
            var result: [[Int]] = []
            find(used: Set<Int>(), lastNumber: 0, k: k, n: n, currentSum: 0, result: &result)
            return result
        }
        
        func find(used: Set<Int>, lastNumber: Int, k: Int, n: Int, currentSum: Int, result: inout [[Int]]) {
            for i in (lastNumber + 1)...9 {
                if used.count + 1 == k {
                    if currentSum + i == n {
                        var newResult = Array(used)
                        newResult.append(i)
                        newResult.sort()
                        result.append(newResult)
                    }
                } else {
                    if currentSum + i <= n && i <= 8 {
                        var newSet = used
                        newSet.insert(i)
                        find(used: newSet, lastNumber: i, k: k, n: n, currentSum: currentSum + i, result: &result)
                    }
                }
            }
        }
    }
}

extension CombinationSumIII.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase2(input1: 9, input2: 45, result: [[1,2,3,4,5,6,7,8,9]], func2: self.combinationSum3),
//            TestCase2(input1: 3, input2: 7, result: [[1,2,4]], func2: self.combinationSum3),
//            TestCase2(input1: 3, input2: 9, result: [[1,2,6],[1,3,5],[2,3,4]], func2: self.combinationSum3),
//            TestCase2(input1: 4, input2: 1, result: [], func2: self.combinationSum3),
        ]
    }
}
