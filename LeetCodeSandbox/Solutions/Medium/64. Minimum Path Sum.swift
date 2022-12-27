//
//  64. Minimum Path Sum.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 27.12.2022.
//

import Foundation

enum MinimumPathSum {
    
    class Solution {
        struct Point: Hashable {
            let x: Int
            let y: Int
        }
        
        var cache: [Point: Int] = [:]
        
        func minPathSum(_ grid: [[Int]]) -> Int {
            cache.removeAll()
            let result = dfs(x: 0, y: 0, grid: grid)
            return result
        }
        
        func dfs(x: Int, y: Int, grid: [[Int]]) -> Int {
            if let cachedValue = cache[Point(x: x, y: y)] {
                return cachedValue
            } else if x == grid[0].count - 1 && y == grid.count - 1 {
                return grid[y][x]
            } else {
                var sum: Int = .max
                
                if x < (grid[0].count - 1) {
                    sum = min(sum, dfs(x: x + 1, y: y, grid: grid))
                }
                
                if y < (grid.count - 1) {
                    sum = min(sum, dfs(x: x, y: y + 1, grid: grid))
                }
                
                let result = sum + grid[y][x]
                cache[Point(x: x, y: y)] = result
                return result
            }
        }
    }
}

extension MinimumPathSum.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [[1,3,1],[1,5,1],[4,2,1]], result: 7, func1: self.minPathSum),
            TestCase1(input1: [[1,2,3],[4,5,6]], result: 12, func1: self.minPathSum),
            TestCase1(input1: [[1,2,3,4,5,6,7,8]], result: 36, func1: self.minPathSum)
        ]
    }
}
