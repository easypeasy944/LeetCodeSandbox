//
//  500. Keyboard Row.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 27.01.2023.
//

import Foundation

enum KeyboardRow {
    
    class Solution {
        func findWords(_ words: [String]) -> [String] {
            var map: [String: Int] = [:]
            "qwertyuiop".forEach { map[String($0)] = 0 }
            "asdfghjkl".forEach { map[String($0)] = 1 }
            "zxcvbnm".forEach { map[String($0)] = 2 }
            
            return words.filter { word in
                let firstLetter = word[word.index(word.startIndex, offsetBy: 0)].lowercased()
                let row = map[firstLetter]!
                
                for i in 1..<word.count {
                    let letter = word[word.index(word.startIndex, offsetBy: i)].lowercased()
                    if map[letter]! != row {
                        return false
                    }
                }
                
                return true
            }
        }
    }
}

extension KeyboardRow.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: ["Hello","Alaska","Dad","Peace"], result: ["Alaska","Dad"], func1: self.findWords)
        ]
    }
}
