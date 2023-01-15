//
//  399. Evaluate Division.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 15.01.2023.
//

import Foundation

enum EvaluateDivision {
    
    class Solution {
        struct Edge: Hashable {
            let end: String
            let value: Double
        }
        
        func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
            var map: [String: [Edge]] = [:]
            
            for i in 0..<equations.count {
                var edge = Edge(end: equations[i][1], value: values[i])
                map[equations[i][0], default: []].append(edge)
                
                edge = Edge(end: equations[i][0], value: 1 / values[i])
                map[equations[i][1], default: []].append(edge)
            }
            
            var result: [Double] = []
            for i in 0..<queries.count {
                result.append(dfs(root: queries[i][0], end: queries[i][1], currentResult: 1.0, map: map, visited: Set<String>()))
            }
            
            return result
        }
        
        func dfs(root: String, end: String, currentResult: Double, map: [String: [Edge]], visited: Set<String>) -> Double {
            if root == end {
                return map[root, default: []].isEmpty ? -1 : 1
            }
            
            var newVisited = visited
            newVisited.insert(root)
            
            for edge in map[root, default: []] {
                let destination = edge.end
                
                if destination == end {
                    return currentResult * edge.value
                }
                
                if !newVisited.contains(destination) {
                    let value = dfs(root: edge.end, end: end, currentResult: currentResult * edge.value, map: map, visited: newVisited)
                    if value != -1 {
                        return value
                    }
                }
            }
            
            return -1
        }
    }
}

extension EvaluateDivision.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase3(
                input1: [["a","b"],["b","c"]],
                input2: [2.0,3.0],
                input3: [["a","c"],["b","a"],["a","e"],["a","a"],["x","x"]],
                result: [6.00000,0.50000,-1.00000,1.00000,-1.00000],
                func3: self.calcEquation
            )
        ]
    }
}
