//
//  1001. Grid Illumination.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 03.01.2023.
//

import Foundation

enum GridIllumination {
    
    class Solution {
        struct Point: Hashable {
            let x: Int
            let y: Int
        }
        
        func gridIllumination(_ n: Int, _ lamps: [[Int]], _ queries: [[Int]]) -> [Int] {
            var set = Set<Point>()
            lamps.forEach { set.insert(Point(x: $0[0], y: $0[1])) }
            var result: [Int] = []
            
            for query in queries {
                let point = Point(x: query[0], y: query[1])
                
                var isTurnedOn: Bool = false
                for lamp in set {
                    if lamp.x == point.x || lamp.y == point.y || abs(Double(lamp.x - point.x) / Double(lamp.y - point.y)) == 1 {
                        isTurnedOn = true
                        break
                    }
                }
                
                result.append(isTurnedOn ? 1 : 0)
                
                for x in -1...1 {
                    for y in -1...1 {
                        set.remove(Point(x: point.x + x, y: point.y + y))
                    }
                }
            }
            
            return result
        }
    }
}

extension GridIllumination.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase3(input1: 5, input2: [[0,0],[4,4]], input3: [[1,1],[1,0]], result: [1,0], func3: self.gridIllumination),
            TestCase3(input1: 5, input2: [[0,0],[4,4]], input3: [[1,1],[1,1]], result: [1,1], func3: self.gridIllumination)
        ]
    }
}
