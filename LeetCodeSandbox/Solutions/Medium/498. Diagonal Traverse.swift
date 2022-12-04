//
//  498. Diagonal Traverse.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 04.12.2022.
//

import Foundation

enum DiagonalTraverse {
    
    class Solution {
        func findDiagonalOrder(_ mat: [[Int]]) -> [Int] {
            let rowsCount = mat.count
            let columnsCount = mat[0].count
            
            let diagonalsCount: Int = rowsCount + columnsCount - 1
            
            var result: [Int] = []
            
            for index in 0..<diagonalsCount {
                if index % 2 == 0 {
                    // TOP
                    let yIndex = min(index, rowsCount - 1)
                    let xIndex = max(0, index - yIndex)
                    
                    let elementsCount = min(
                        yIndex + 1,
                        columnsCount - xIndex
                    )
                    
                    for k in 0..<elementsCount {
                        result.append(mat[yIndex - k][xIndex + k])
                    }
                } else {
                    // DOWN
                    let xIndex = min(index, columnsCount - 1)
                    let yIndex = max(0, index - xIndex)
                    
                    let elementsCount = min(
                        xIndex + 1,
                        rowsCount - yIndex
                    )
                    
                    for k in 0..<elementsCount {
                        result.append(mat[yIndex + k][xIndex - k])
                    }
                }
            }
            
            return result
        }
    }
}

extension DiagonalTraverse.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [[1,2,3],[4,5,6],[7,8,9]], result: [1,2,4,7,5,3,6,8,9], func1: self.findDiagonalOrder),
            TestCase1(input1: [[1,2,3,4],[5,6,7,8],[9,10,11,12]], result: [1,2,5,9,6,3,4,7,10,11,8,12], func1: self.findDiagonalOrder)
        ]
    }
}
