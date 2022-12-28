//
//  695. Max Area of Island.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 28.12.2022.
//

import Foundation

enum MaxAreaOfIsland {
    
    class Solution {
        struct Point: Hashable {
            let row: Int
            let column: Int
        }
        
        func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
            var seenPoints = Set<Point>()
            var maxLength: Int = 0
            
            for row in 0..<grid.count {
                for column in 0..<grid[0].count {
                    let point = Point(row: row, column: column)
                    if !seenPoints.contains(point) && grid[row][column] == 1 {
                        maxLength = max(maxLength, dfs(point, grid: grid, seenPoints: &seenPoints))
                    }
                }
            }
            
            return maxLength
        }
        
        func dfs(_ startPoint: Point, grid: [[Int]], seenPoints: inout Set<Point>) -> Int {
            if startPoint.row >= 0 && startPoint.row < grid.count &&
                startPoint.column >= 0 && startPoint.column < grid[0].count &&
                grid[startPoint.row][startPoint.column] == 1 &&
                !seenPoints.contains(startPoint)
            {
                
                seenPoints.insert(startPoint)
                
                var totalLength = 1
                totalLength += dfs(Point(row: startPoint.row + 1, column: startPoint.column), grid: grid, seenPoints: &seenPoints)
                totalLength += dfs(Point(row: startPoint.row, column: startPoint.column + 1), grid: grid, seenPoints: &seenPoints)
                totalLength += dfs(Point(row: startPoint.row - 1, column: startPoint.column), grid: grid, seenPoints: &seenPoints)
                totalLength += dfs(Point(row: startPoint.row, column: startPoint.column - 1), grid: grid, seenPoints: &seenPoints)
                
                return totalLength
            } else {
                return 0
            }
        }
    }
}

extension MaxAreaOfIsland.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [[0,0,1,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,1,1,0,1,0,0,0,0,0,0,0,0],[0,1,0,0,1,1,0,0,1,0,1,0,0],[0,1,0,0,1,1,0,0,1,1,1,0,0],[0,0,0,0,0,0,0,0,0,0,1,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,0,1,1,0,0,0,0]], result: 6, func1: self.maxAreaOfIsland),
            TestCase1(input1: [[0,0,0,0,0,0,0,0]], result: 0, func1: self.maxAreaOfIsland)
        ]
    }
}
