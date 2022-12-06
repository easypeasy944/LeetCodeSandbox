//
//  417. Pacific Atlantic Water Flow.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 06.12.2022.
//

import Foundation

enum PacificAtlanticWaterFlow {
    
    class Solution {
        struct Coordinate: Hashable {
            let x, y: Int
        }
        
        func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
            let rowsCount: Int = heights.count
            let columnsCount = heights[0].count
            
            var allPacificOceanCoordinates = Set<Coordinate>()
            var currentPacificOceanCoordinates = Set<Coordinate>()
            var allAtlanticOceanCoordinates = Set<Coordinate>()
            var currentAtlanticOceanCoordinates = Set<Coordinate>()
            
            for x in 0..<columnsCount {
                currentPacificOceanCoordinates.insert(Coordinate(x: x, y: 0))
                currentAtlanticOceanCoordinates.insert(Coordinate(x: x, y: rowsCount - 1))
            }
            
            for y in 0..<rowsCount {
                currentPacificOceanCoordinates.insert(Coordinate(x: 0, y: y))
                currentAtlanticOceanCoordinates.insert(Coordinate(x: columnsCount - 1, y: y))
            }
            
            while !currentPacificOceanCoordinates.isEmpty {
                allPacificOceanCoordinates = allPacificOceanCoordinates.union(currentPacificOceanCoordinates)
                
                var newCoords = Set<Coordinate>()
                for coord in currentPacificOceanCoordinates {
                    if 0..<columnsCount ~= coord.x + 1 && heights[coord.y][coord.x + 1] >= heights[coord.y][coord.x] {
                        newCoords.insert(Coordinate(x: coord.x + 1, y: coord.y))
                    }
                    if 0..<columnsCount ~= coord.x - 1 && heights[coord.y][coord.x - 1] >= heights[coord.y][coord.x] {
                        newCoords.insert(Coordinate(x: coord.x - 1, y: coord.y))
                    }
                    if 0..<rowsCount ~= coord.y - 1 && heights[coord.y - 1][coord.x] >= heights[coord.y][coord.x] {
                        newCoords.insert(Coordinate(x: coord.x, y: coord.y - 1))
                    }
                    if 0..<rowsCount ~= coord.y + 1 && heights[coord.y + 1][coord.x] >= heights[coord.y][coord.x] {
                        newCoords.insert(Coordinate(x: coord.x, y: coord.y + 1))
                    }
                }
                currentPacificOceanCoordinates = newCoords.subtracting(allPacificOceanCoordinates)
            }
            
            while !currentAtlanticOceanCoordinates.isEmpty {
                allAtlanticOceanCoordinates = allAtlanticOceanCoordinates.union(currentAtlanticOceanCoordinates)
                
                var newCoords = Set<Coordinate>()
                for coord in currentAtlanticOceanCoordinates {
                    if 0..<columnsCount ~= coord.x + 1 && heights[coord.y][coord.x + 1] >= heights[coord.y][coord.x] {
                        newCoords.insert(Coordinate(x: coord.x + 1, y: coord.y))
                    }
                    if 0..<columnsCount ~= coord.x - 1 && heights[coord.y][coord.x - 1] >= heights[coord.y][coord.x] {
                        newCoords.insert(Coordinate(x: coord.x - 1, y: coord.y))
                    }
                    if 0..<rowsCount ~= coord.y - 1 && heights[coord.y - 1][coord.x] >= heights[coord.y][coord.x] {
                        newCoords.insert(Coordinate(x: coord.x, y: coord.y - 1))
                    }
                    if 0..<rowsCount ~= coord.y + 1 && heights[coord.y + 1][coord.x] >= heights[coord.y][coord.x] {
                        newCoords.insert(Coordinate(x: coord.x, y: coord.y + 1))
                    }
                }
                currentAtlanticOceanCoordinates = newCoords.subtracting(allAtlanticOceanCoordinates)
            }
            
            let result = allPacificOceanCoordinates.intersection(allAtlanticOceanCoordinates).map({ [$0.y, $0.x] })
            return result
        }
    }
}

extension PacificAtlanticWaterFlow.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        let comparator: ([[Int]], [[Int]]) -> Bool = { lhs, rhs in
            Set(lhs) == Set(rhs)
        }
        return [
            TestCase1(input1: [[1,2,2,3,5],[3,2,3,4,4],[2,4,5,3,1],[6,7,1,4,5],[5,1,1,2,4]], result: [[0,4],[1,3],[1,4],[2,2],[3,0],[3,1],[4,0]], func1: self.pacificAtlantic, comparator: comparator),
            TestCase1(input1: [[1]], result: [[0, 0]], func1: self.pacificAtlantic, comparator: comparator),
        ]
    }
}
