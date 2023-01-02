//
//  39. Combination Sum.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 24.08.2022.
//

import Foundation

enum CombinationSum {
    
    class Solution {
        func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
            let numbers = candidates.sorted()
            var cache: [Int: Set<[Int]>] = [:]
            
            _ = getCombinations(candidates: numbers, target: target, cache: &cache)
            
            return Array(cache[target] ?? Set())
        }
        
        func getCombinations(candidates: [Int], target: Int, cache: inout [Int: Set<[Int]>]) -> Set<[Int]> {
            if let combinations = cache[target] {
                return combinations
            } else if target < candidates[0] {
                cache[target] = Set([])
                return Set()
            } else {
                for candidate in candidates where candidate <= target {
                    if candidate == target {
                        cache[target, default: Set<[Int]>()].insert([target])
                        continue
                    }
                    
                    let results1 = getCombinations(candidates: candidates, target: candidate, cache: &cache)
                    let results2 = getCombinations(candidates: candidates, target: target - candidate, cache: &cache)
                    
                    for array1 in results1 {
                        for array2 in results2 {
                            let newArray = (array1 + array2).sorted()
                            cache[target, default: Set<[Int]>()].insert(newArray)
                        }
                    }
                }
                
                return cache[target] ?? Set()
            }
        }
    }
}

extension CombinationSum.Solution: SolutionProtocol {
    var testCases: [Validatable] {
        let comparator: ([[Int]], [[Int]]) -> Bool = { (result1, result2) -> Bool in
            guard result1.count == result2.count else { return false }
            return Set(result1) == Set(result2)
        }
        
        return [
            TestCase2(input1: [2,3,6], input2: 6, result: [[2,2,2],[3,3],[6]], func2: self.combinationSum, comparator: comparator),
            TestCase2(input1: [2,3,6,7], input2: 7, result: [[2,2,3],[7]], func2: self.combinationSum, comparator: comparator),
            TestCase2(input1: [2,3,5], input2: 8, result: [[2,2,2,2],[2,3,3],[3,5]], func2: self.combinationSum, comparator: comparator),
            TestCase2(input1: [3,5,7], input2: 8, result: [[3,5]], func2: self.combinationSum, comparator: comparator),
            TestCase2(input1: [2], input2: 1, result: [], func2: self.combinationSum, comparator: comparator),
        ]
    }
}
