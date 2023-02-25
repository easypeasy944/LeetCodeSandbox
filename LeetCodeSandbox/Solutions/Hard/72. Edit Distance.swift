//
//  72. Edit Distance.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 25.02.2023.
//

import Foundation

enum EditDistance {
    
    class Solution {
        struct Key: Hashable {
            let wordIndex: Int
            let targetIndex: Int
        }
        
        func minDistance(_ word1: String, _ word2: String) -> Int {
            let word = Array(word1)
            let target = Array(word2)
            var cache: [Key: Int] = [:]
            
            func calcDistance(
                _ wordIndex: Int,
                _ targetIndex: Int
            ) -> Int {
                if wordIndex >= word.count {
                    return target.count - targetIndex
                } else if targetIndex >= target.count {
                    return word.count - wordIndex
                }
                
                if let value = cache[Key(wordIndex: wordIndex, targetIndex: targetIndex)] {
                    return value
                }
                
                var minDistance: Int = .max
                
                if word[wordIndex] == target[targetIndex] {
                    let result = calcDistance(wordIndex + 1, targetIndex + 1)
                    minDistance = min(minDistance, result)
                }
                
                let resultWithReplace = calcDistance(wordIndex + 1, targetIndex + 1)
                minDistance = min(minDistance, 1 + resultWithReplace)
                
                let resultWithDelete = calcDistance(wordIndex + 1, targetIndex)
                minDistance = min(minDistance, 1 + resultWithDelete)
                
                let resultWithInsert = calcDistance(wordIndex, targetIndex + 1)
                minDistance = min(minDistance, 1 + resultWithInsert)
                
                cache[Key(wordIndex: wordIndex, targetIndex: targetIndex)] = minDistance
                return minDistance
            }
            
            let result = calcDistance(0, 0)
            return result
        }
    }
}

extension EditDistance.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase2(input1: "dinitrophenylhydrazine", input2: "acetylphenylhydrazine", result: 6, func2: self.minDistance),
//            TestCase2(input1: "park", input2: "spake", result: 3, func2: self.minDistance),
//            TestCase2(input1: "intention", input2: "execution", result: 5, func2: self.minDistance),
//            TestCase2(input1: "horse", input2: "ros", result: 3, func2: self.minDistance),
        ]
    }
}
