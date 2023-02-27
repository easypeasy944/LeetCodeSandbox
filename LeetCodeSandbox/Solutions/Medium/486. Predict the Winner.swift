//
//  486. Predict the Winner.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 27.02.2023.
//

import Foundation

enum PredictTheWinner {
    
    class Solution {
        struct Key: Hashable {
            let l: Int
            let r: Int
        }
        
        func PredictTheWinner(_ nums: [Int]) -> Bool {
            var cache: [Key: Int] = [:]
            
            func calcMaxScore(_ l: Int, _ r: Int) -> Int {
                if r == l {
                    return nums[l]
                } else if r < l {
                    return 0
                } else if let value = cache[Key(l: l, r: r)] {
                    return value
                } else {
                    var maxScore: Int = .min
                    maxScore = max(
                        maxScore,
                        calcMaxScore(l, l) - calcMaxScore(l + 1, r)
                    )
                    maxScore = max(
                        maxScore,
                        calcMaxScore(r, r) - calcMaxScore(l, r - 1)
                    )
                    
                    cache[Key(l: l, r: r)] = maxScore
                    return maxScore
                }
            }
            
            let sum = nums.reduce(0, +)
            let maxScore = calcMaxScore(0, nums.count - 1)
            
            return maxScore >= 0
        }
    }
}

extension PredictTheWinner.Solution: SolutionProtocol {
    
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [1,5,2], result: false, func1: self.PredictTheWinner),
            TestCase1(input1: [1,5,233,7], result: true, func1: self.PredictTheWinner),
        ]
    }
}

extension Array where Element == Int {
    
    subscript(safe index: Int) -> Int {
        guard 0..<count ~= index else { return 0 }
        return self[index]
    }
}
