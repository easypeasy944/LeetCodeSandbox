//
//  383. Ransom Note.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 15.12.2022.
//

import Foundation

enum RansomNote {
    
    class Solution {
        func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
            var magazineMap: [Character: Int] = [:]
            var ransomNoteMap: [Character: Int] = [:]
            
            magazine.forEach { magazineMap[$0, default: 0] += 1 }
            ransomNote.forEach { ransomNoteMap[$0, default: 0] += 1 }
            
            for (key, value) in ransomNoteMap {
                if value > magazineMap[key, default: 0] {
                    return false
                }
            }
            
            return true
        }
    }
}

extension RansomNote.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase2(input1: "aa", input2: "ab", result: false, func2: self.canConstruct),
            TestCase2(input1: "aa", input2: "aab", result: true, func2: self.canConstruct),
        ]
    }
}
