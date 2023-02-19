//
//  473. Matchsticks to Square.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 19.02.2023.
//

import Foundation

enum MatchsticksToSquare {
    
    class Solution {
        func makesquare(_ matchsticks: [Int]) -> Bool {
            let sortedSticks = matchsticks.sorted(by: >)
            let sum = sortedSticks.reduce(0, +)
            var sides = Array(repeating: 0, count: 4)
            
            if sum % 4 != 0 {
                return false
            }
            
            let target = sum / 4
            
            func match(_ i: Int) -> Bool {
                if i == sortedSticks.count {
                    return true
                } else {
                    for j in 0..<4 {
                        if sides[j] + sortedSticks[i] <= target {
                            sides[j] += sortedSticks[i]
                            
                            if match(i + 1) {
                                return true
                            }
                            
                            sides[j] -= sortedSticks[i]
                            
                            if sides[j] == 0 {
                                return false
                            }
                        }
                    }
                    
                    return false
                }
            }
            
            let result = match(0)
            return result
        }
    }
}

extension MatchsticksToSquare.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [1,1,2,2,2], result: true, func1: self.makesquare)
        ]
    }
}
