//
//  785. Is Graph Bipartite?.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 16.01.2023.
//

import Foundation

enum IsGraphBipartite {
    
    class Solution {
        var colors: [Int] = []
        
        func isBipartite(_ graph: [[Int]]) -> Bool {
            var map: [Int: Set<Int>] = [:]
            colors = Array(repeating: 0, count: graph.count)
            
            for i in 0..<graph.count {
                map[i] = Set<Int>(graph[i])
            }
            
            for i in 0..<graph.count {
                if colors[i] == 0 {
                    if !dfs(v: i, color: 1, map: map) {
                        return false
                    }
                }
            }
            
            return true
        }
        
        func dfs(v: Int, color: Int, map: [Int: Set<Int>]) -> Bool {
            colors[v] = color
            
            for neighbor in map[v, default: Set<Int>()] {
                if colors[neighbor] == 0 {
                    if !dfs(v: neighbor, color: color == 1 ? 2 : 1, map: map) {
                        return false
                    }
                } else if colors[neighbor] == color {
                    return false
                }
            }
            
            return true
        }
    }
}

extension IsGraphBipartite.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [[1,2,3],[0,2],[0,1,3],[0,2]], result: false, func1: self.isBipartite),
            TestCase1(input1: [[1,3],[0,2],[1,3],[0,2]], result: true, func1: self.isBipartite),
        ]
    }
}
