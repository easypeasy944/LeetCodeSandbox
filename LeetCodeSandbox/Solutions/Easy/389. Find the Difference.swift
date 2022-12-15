//
//  389. Find the Difference.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 15.12.2022.
//

import Foundation

enum FindTheDifference {
    
    class Solution {
        func findTheDifference(_ s: String, _ t: String) -> Character {
            var originalMap: [Character: Int] = [:]
            s.forEach { originalMap[$0, default: 0] += 1 }
            
            var newMap: [Character: Int] = [:]
            t.forEach { newMap[$0, default: 0] += 1 }
            
            for (key, value) in newMap {
                if value > originalMap[key, default: 0] {
                    return key
                }
            }
            
            return Character("")
        }
    }
}

extension FindTheDifference.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase2(input1: "abcd", input2: "bcade", result: "e", func2: self.findTheDifference),
            TestCase2(input1: "", input2: "a", result: "a", func2: self.findTheDifference),
            TestCase2(input1: "ab", input2: "bab", result: "b", func2: self.findTheDifference),
        ]
    }
}
