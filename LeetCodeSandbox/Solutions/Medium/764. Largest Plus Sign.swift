//
//  764. Largest Plus Sign.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 21.02.2023.
//

import Foundation

enum LargestPlusSign {
    
    class Solution {
        struct Point: Hashable {
            let x: Int
            let y: Int
        }
        
        func orderOfLargestPlusSign(_ n: Int, _ mines: [[Int]]) -> Int {
            var mineSet = Set<Point>()
            mines.forEach { mineSet.insert(Point(x: $0[1], y: $0[0])) }
            
            var matrix = Array(repeating: Array(repeating: Int.max, count: n), count: n)
            
            for row in 0..<n {
                var forwardCount: Int = 0
                var backwardCount: Int = 0
                
                for column in 0..<n {
                    matrix[row][column] = min(matrix[row][column], forwardCount)
                    matrix[row][n - column - 1] = min(matrix[row][n - column - 1], backwardCount)
                    
                    if mineSet.contains(Point(x: column, y: row)) {
                        forwardCount = 0
                    } else {
                        forwardCount += 1
                    }
                    if mineSet.contains(Point(x: n - column - 1, y: row)) {
                        backwardCount = 0
                    } else {
                        backwardCount += 1
                    }
                }
            }
            
            for column in 0..<n {
                var forwardCount: Int = 0
                var backwardCount: Int = 0
                
                for row in 0..<n {
                    matrix[row][column] = min(matrix[row][column], forwardCount)
                    matrix[n - row - 1][column] = min(matrix[n - row - 1][column], backwardCount)
                    
                    if mineSet.contains(Point(x: column, y: row)) {
                        forwardCount = 0
                    } else {
                        forwardCount += 1
                    }
                    if mineSet.contains(Point(x: column, y: n - row - 1)) {
                        backwardCount = 0
                    } else {
                        backwardCount += 1
                    }
                }
            }
            
            var globalMax: Int = 0
            
            for row in 0..<n {
                for column in 0..<n {
                    if !mineSet.contains(Point(x: column, y: row)) {
                        if matrix[row][column] == 0 {
                            globalMax = max(globalMax, 1)
                        } else {
                            globalMax = max(globalMax, matrix[row][column] + 1)
                        }
                    }
                }
            }
            
            return globalMax
        }
    }
}

extension LargestPlusSign.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase2(input1: 5, input2: [[3,0],[3,3]], result: 3, func2: self.orderOfLargestPlusSign),
            TestCase2(input1: 5, input2: [[4,2]], result: 2, func2: self.orderOfLargestPlusSign),
            TestCase2(input1: 1, input2: [[0,0]], result: 0, func2: self.orderOfLargestPlusSign),
            TestCase2(input1: 2, input2: [[0,0],[0,1],[1,0]], result: 1, func2: self.orderOfLargestPlusSign),
        ]
    }
}
