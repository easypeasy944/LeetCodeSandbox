//
//  54. Spiral Matrix.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 08.01.2023.
//

import Foundation

enum SpiralMatrix {
    
    class Solution {
        enum Direction {
            case up, down, left, right
        }
        
        func spiralOrder(_ matrix: [[Int]]) -> [Int] {
            var result: [Int] = []
            
            var tRow: Int = 0
            var lRow: Int = matrix.count - 1
            
            var lColumn: Int = 0
            var rColumn: Int = matrix[0].count - 1
            
            var direction: Direction = .right
            
            while tRow <= lRow && lColumn <= rColumn {
                switch direction {
                case .right:
                    for column in (lColumn...rColumn) {
                        result.append(matrix[tRow][column])
                    }
                    direction = .down
                    tRow += 1
                    
                case .down:
                    for row in (tRow...lRow) {
                        result.append(matrix[row][rColumn])
                    }
                    direction = .left
                    rColumn -= 1
                    
                case .left:
                    for column in (lColumn...rColumn).reversed() {
                        result.append(matrix[lRow][column])
                    }
                    direction = .up
                    lRow -= 1
                    
                case .up:
                    for row in (tRow...lRow).reversed() {
                        result.append(matrix[row][lColumn])
                    }
                    direction = .right
                    lColumn += 1
                }
            }
            
            return result
        }
    }
}

extension SpiralMatrix.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [[1,2,3]], result: [1,2,3], func1: self.spiralOrder),
            TestCase1(input1: [[1,2,3],[4,5,6],[7,8,9]], result: [1,2,3,6,9,8,7,4,5], func1: self.spiralOrder),
            TestCase1(input1: [[1,2,3,4,5],[6,7,8,9,10],[11,12,13,14,15],[16,17,18,19,20],[21,22,23,24,25]], result: [1,2,3,4,5,10,15,20,25,24,23,22,21,16,11,6,7,8,9,14,19,18,17,12,13], func1: self.spiralOrder)
        ]
    }
}
