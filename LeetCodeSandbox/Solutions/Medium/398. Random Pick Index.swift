//
//  398. Random Pick Index.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 15.12.2022.
//

enum RandomPickIndex {
    
    class Solution {
        var map: [Int: [Int]] = [:]
        
        init(_ nums: [Int]) {
            nums.enumerated().forEach {
                map[$0.element, default: []].append($0.offset)
            }
        }
        
        func pick(_ target: Int) -> Int {
            let array = map[target, default: []]
            return array[Int.random(in: 0..<array.count)]
        }
    }
}

extension RandomPickIndex.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            
        ]
    }
}
