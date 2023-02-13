//
//  2011. Final Value of Variable After Performing Operations.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 13.02.2023.
//

import Foundation

enum FinalValueOfVariableAfterPerformingOperations {
    
    class Solution {
        func finalValueAfterOperations(_ operations: [String]) -> Int {
            var count: Int = 0
            
            for operation in operations {
                if operation == "X++" || operation == "++X" {
                    count += 1
                } else if operation == "X--" || operation == "--X" {
                    count -= 1
                }
            }
            
            return count
        }
    }
}

extension FinalValueOfVariableAfterPerformingOperations.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: ["--X","X++","X++"], result: 1, func1: self.finalValueAfterOperations)
        ]
    }
}
