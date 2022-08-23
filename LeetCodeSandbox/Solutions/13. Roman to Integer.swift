//
//  13. Roman to Integer.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 22.08.2022.
//

import Foundation

enum RomanToInteger {
    
    class Solution {
        let map = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        ]
        
        func romanToInt(_ s: String) -> Int {
            var result: Int = 0
            var index: Int = 0
            
            while index < s.count {
                let currentCharacter = s[index]!
                let nextCharacter = s[index + 1]
                
                if nextCharacter != nil && map[currentCharacter]! > map[nextCharacter!]! {
                    result += map[currentCharacter]!
                    index += 1
                } else if nextCharacter != nil && map[currentCharacter]! < map[nextCharacter!]! {
                    result += map[nextCharacter!]! - map[currentCharacter]!
                    index += 2
                } else {
                    result += map[currentCharacter]!
                    index += 1
                }
            }
            
            return result
        }
    }
}

extension RomanToInteger.Solution: SolutionProtocol {
    
    var testCases: [Validatable] {
        return [
            TestCase1(input1: "LVIII", result: 58, func1: self.romanToInt),
            TestCase1(input1: "MCMXCIV", result: 1994, func1: self.romanToInt),
            TestCase1(input1: "V", result: 5, func1: self.romanToInt),
            TestCase1(input1: "IV", result: 4, func1: self.romanToInt)
        ]
    }
}
