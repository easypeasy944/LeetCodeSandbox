//
//  290. Word Pattern.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 04.12.2022.
//

import Foundation

enum WordPattern {
    
    class Solution {
        func wordPattern(_ pattern: String, _ s: String) -> Bool {
            var stringMap: [String: Character] = [:]
            var charMap: [Character: String] = [:]
            
            var pointer: Int = 0
            var wordCount: Int = 0
            
            while pointer < s.count && wordCount < pattern.count {
                let startIndex = pointer
                while pointer < s.count && s[s.index(s.startIndex, offsetBy: pointer)] != " " {
                    pointer += 1
                }
                let word = String(s[s.index(s.startIndex, offsetBy: startIndex)..<s.index(s.startIndex, offsetBy: pointer)])
                let patternChar = pattern[s.index(s.startIndex, offsetBy: wordCount)]
                
                if stringMap[word] != nil || charMap[patternChar] != nil {
                    if stringMap[word] != patternChar || charMap[patternChar] != word {
                        return false
                    }
                } else {
                    stringMap[word] = patternChar
                    charMap[patternChar] = word
                }
                
                wordCount += 1
                pointer += 1
            }
            
            return pointer - 1 == s.count && wordCount == pattern.count
        }
    }
}

extension WordPattern.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase2(input1: "abba", input2: "dog cat cat dog", result: true, func2: self.wordPattern),
            TestCase2(input1: "abba", input2: "dog cat cat fish", result: false, func2: self.wordPattern),
            TestCase2(input1: "aaaa", input2: "dog cat cat dog", result: false, func2: self.wordPattern),
            TestCase2(input1: "abba", input2: "dog dog dog dog", result: false, func2: self.wordPattern),
            TestCase2(input1: "aaa", input2: "aa aa aa aa", result: false, func2: self.wordPattern),
        ]
    }
}
