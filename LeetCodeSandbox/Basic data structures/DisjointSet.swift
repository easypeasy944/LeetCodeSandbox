//
//  DisjointSet.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 06.01.2023.
//

import Foundation

struct DisjointSet: Equatable {
    private var parent: [Int]
    private var rank: [Int]
    private let size: Int
    
    init(size: Int) {
        self.size = size
        parent = Array(repeating: -1, count: size)
        rank = Array(repeating: 0, count: size)
        
        for i in 0..<size {
            parent[i] = i
        }
    }
    
    mutating func find(_ value: Int) -> Int {
        if value == parent[value] {
            return value
        } else {
            let result = find(parent[value])
            parent[value] = result
            return result
        }
    }
    
    mutating func union(_ x: Int, _ y: Int) {
        let parentX = find(x)
        let parentY = find(y)
        
        if parentX == parentY {
            return
        }
        
        if rank[parentX] > rank[parentY] {
            parent[parentY] = parentX
        } else if rank[parentX] < rank[parentY] {
            parent[parentX] = parentY
        } else {
            parent[parentY] = parentX
            rank[parentX] += 1
        }
    }
}
