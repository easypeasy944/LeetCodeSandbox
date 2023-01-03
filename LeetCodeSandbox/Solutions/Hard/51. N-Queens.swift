//
//  51. N-Queens.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 03.01.2023.
//

import Foundation

enum NQueens {
    
    class Solution {
        struct Point: Hashable {
            let x: Int
            let y: Int
        }
        
        func solveNQueens(_ n: Int) -> [[String]] {
            let grid: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
            
            let solution = solve(grid: grid, placedQueens: Set<Point>())
            
            let result: [[String]] = solution.map { (grid: [[Int]]) in
                grid.compactMap { (row: [Int]) in
                    String(row.map { $0 == 1 ? "Q" : "." })
                }
            }
            
            return result
        }
        
        private func solve(grid: [[Int]], placedQueens: Set<Point>) -> [[[Int]]] {
            var result: [[[Int]]] = []
            
            for column in 0..<grid[placedQueens.count].count {
                if grid[placedQueens.count][column] == 0 && placedQueens.allSatisfy({
                    $0.x != column &&
                    $0.y != placedQueens.count &&
                    abs(Double($0.x - column) / Double($0.y - placedQueens.count)) != 1
                }) {
                    var newGrid = grid
                    newGrid[placedQueens.count][column] = 1
                    var newPlacedQueens = placedQueens
                    newPlacedQueens.insert(Point(x: column, y: placedQueens.count))
                    
                    if newPlacedQueens.count == grid.count {
                        result.append(newGrid)
                    } else {
                        let solution = solve(grid: newGrid, placedQueens: newPlacedQueens)
                        if !solution.isEmpty {
                            result.append(contentsOf: solution)
                        }
                    }
                }
            }
            
            return result
        }
    }
}

extension NQueens.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: 4, result: [[".Q..","...Q","Q...","..Q."],["..Q.","Q...","...Q",".Q.."]], func1: self.solveNQueens),
            TestCase1(input1: 9, result: [[".Q..","...Q","Q...","..Q."],["..Q.","Q...","...Q",".Q.."]], func1: self.solveNQueens)
        ]
    }
}
