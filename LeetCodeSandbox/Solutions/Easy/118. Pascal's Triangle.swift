//
//  118. Pascal's Triangle.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 20.12.2022.
//

import Foundation

enum PascalTriangle {
    
    class Solution {
        func generate(_ numRows: Int) -> [[Int]] {
            var currentRow: [Int] = [1]
            var result: [[Int]] = [currentRow]
            
            for row in 1..<numRows {
                var newRow = Array(repeating: 0, count: row + 1)
                newRow[0] = 1
                newRow[newRow.count - 1] = 1
                for j in 0..<(currentRow.count - 1) {
                    newRow[j + 1] = currentRow[j] + currentRow[j + 1]
                }
                result.append(newRow)
                currentRow = newRow
            }
            
            return result
        }
    }
}

extension PascalTriangle.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: 5, result: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]], func1: self.generate),
            TestCase1(input1: 1, result: [[1]], func1: self.generate)
        ]
    }
}
