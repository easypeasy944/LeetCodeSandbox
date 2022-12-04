//
//  289. Game of Life.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 04.12.2022.
//

import Foundation

enum GameOfLife {
    
    class Solution {
        func gameOfLife(_ board: inout [[Int]]) {
            var changes: [(row: Int, column: Int)] = []
            
            for row in 0..<board.count {
                for column in 0..<board[row].count {
                    var sum: Int = 0
                    
                    for dx in -1...1 {
                        for dy in -1...1 {
                            if 0..<board[row].count ~= (column + dx) && 0..<board.count ~= (row + dy) && !(dx == 0 && dy == 0) {
                                sum += board[row + dy][column + dx]
                            }
                        }
                    }
                    
                    if board[row][column] == 1 && (sum < 2 || sum > 3) {
                        changes.append((row, column))
                    } else if board[row][column] == 1 && 2...3 ~= sum {
                        // nothing
                    } else if board[row][column] == 0 && sum == 3 {
                        changes.append((row, column))
                    }
                }
            }
            
            changes.forEach { (row: Int, column: Int) in
                board[row][column] = board[row][column] == 0 ? 1 : 0
            }
        }
        
        private func _gameOfLife(_ board: [[Int]]) -> [[Int]] {
            var board = board
            gameOfLife(&board)
            return board
        }
    }
}

extension GameOfLife.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [[0,1,0],[0,0,1],[1,1,1],[0,0,0]], result: [[0,0,0],[1,0,1],[0,1,1],[0,1,0]], func1: self._gameOfLife),
            TestCase1(input1: [[1,1],[1,0]], result: [[1,1],[1,1]], func1: self._gameOfLife),
        ]
    }
}
