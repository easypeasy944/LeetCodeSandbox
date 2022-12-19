//
//  77. Combinations.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 19.12.2022.
//

import Foundation

enum Combinations {
    
    class Solution {
        func combine(_ n: Int, _ k: Int) -> [[Int]] {
            if n == 1 {
                return [[1]]
            } else {
                let combinations = getCombinations(n: n, k: k, set: Set<Int>())
                return combinations
            }
        }
        
        private func getCombinations(n: Int, k: Int, set: Set<Int>) -> [[Int]] {
            if k == 1 {
                var result: [[Int]] = []
                for i in 1...n where !set.contains(i) {
                    result.append([i])
                }
                return result
            } else {
                var result: [[Int]] = []
                var newSet = set
                for i in 1...n where !newSet.contains(i) {
                    newSet.insert(i)
                    var combinations = getCombinations(n: n, k: k - 1, set: newSet)
                    combinations = combinations.map {
                        var newArray = $0
                        newArray.insert(i, at: 0)
                        return newArray
                    }
                    result.append(contentsOf: combinations)
                }
                
                return result
            }
        }
    }
}

extension Combinations.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase2(input1: 4, input2: 2, result: [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]], func2: self.combine),
            TestCase2(input1: 4, input2: 3, result: [[1,2,3],[1,2,4],[1,3,4],[2,3,4]], func2: self.combine),
            TestCase2(input1: 1, input2: 1, result: [[1]], func2: self.combine),
        ]
    }
}
