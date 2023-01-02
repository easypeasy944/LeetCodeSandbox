//
//  451. Sort Characters By Frequency.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 02.01.2023.
//

import Foundation

enum SortCharactersByFrequency {
    
    class Solution {
        func frequencySort(_ s: String) -> String {
            var map: [Character: Int] = [:]
            
            s.forEach { map[$0, default: 0] += 1 }
            
            let sortedArray = s.sorted { lhs, rhs in
                if map[lhs]! > map[rhs]! {
                    return true
                } else if map[lhs]! < map[rhs]! {
                    return false
                } else {
                    let lhsCode = lhs.unicodeScalars[lhs.unicodeScalars.startIndex].value
                    let rhsCode = rhs.unicodeScalars[rhs.unicodeScalars.startIndex].value
                    
                    return lhsCode < rhsCode
                }
            }
            
            return String(sortedArray)
        }
    }
}

extension SortCharactersByFrequency.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: "tree", result: "eert", func1: self.frequencySort),
            TestCase1(input1: "cccaaa", result: "aaaccc", func1: self.frequencySort),
            TestCase1(input1: "AaSdasLlkLjASAMnLJSAaLASLASLdmansdnalasd", result: "AAAAAALLLLLLaaaaaaSSSSSddddnnnsssllJMjkm", func1: self.frequencySort),
            TestCase1(input1: "Aabb", result: "bbAa", func1: self.frequencySort),
        ]
    }
}
