//
//  73. Set Matrix Zeroes.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 25.02.2023.
//

import Foundation

enum SetMatrixZeroes {
    
    class Solution {
        func setZeroes(_ matrix: inout [[Int]]) {
            var columns = Set<Int>()
            var rows = Set<Int>()
            
            for row in 0..<matrix.count {
                var contains = false
                for column in 0..<matrix[row].count {
                    if matrix[row][column] == 0 {
                        contains = true
                        columns.insert(column)
                    }
                }
                if contains {
                    rows.insert(row)
                }
            }
            
            for row in rows {
                for column in 0..<matrix[row].count {
                    matrix[row][column] = 0
                }
            }
            
            for column in columns {
                for row in 0..<matrix.count {
                    matrix[row][column] = 0
                }
            }
        }
        
        func run(_ matrix: [[Int]]) -> [[Int]] {
            var matrix = matrix
            setZeroes(&matrix)
            return matrix
        }
    }
}

extension SetMatrixZeroes.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(
                input1: [[1,2,3,4],[5,0,7,8],[0,10,11,12],[13,14,15,0]],
                result: [[0,0,3,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]],
                func1: self.run
            ),
            TestCase1(
                input1: [[1,1,1],[1,0,1],[1,1,1]],
                result: [[1,0,1],[0,0,0],[1,0,1]],
                func1: self.run
            ),
            TestCase1(
                input1: [[0,1,2,0],[3,4,5,2],[1,3,1,5]],
                result: [[0,0,0,0],[0,4,5,0],[0,3,1,0]],
                func1: self.run
            )
        ]
    }
}
