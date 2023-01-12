//
//  1816. Truncate Sentence.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 12.01.2023.
//

import Foundation

enum TruncateSentence {
    
    class Solution {
        func truncateSentence(_ s: String, _ k: Int) -> String {
            var count: Int = 0
            var offset: Int = -1
            
            while offset < s.count && count != k {
                offset += 1
                if offset < s.count && s[s.index(s.startIndex, offsetBy: offset)] == " " {
                    count += 1
                }
            }
            
            let str = String(s[s.index(s.startIndex, offsetBy: 0)..<s.index(s.startIndex, offsetBy: offset)])
            return str
        }
    }
}

extension TruncateSentence.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase2(input1: "Hello how are you Contestant", input2: 4, result: "Hello how are you", func2: self.truncateSentence),
            TestCase2(input1: "What is the solution to this problem", input2: 4, result: "What is the solution", func2: self.truncateSentence),
            TestCase2(input1: "chopper is not a tanuki", input2: 5, result: "chopper is not a tanuki", func2: self.truncateSentence)
            
        ]
    }
}
