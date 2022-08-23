//
//  17. Letter Combinations of a Phone Number.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 22.08.2022.
//

import Foundation

enum LetterCombinationsOfAPhoneNumber {
    
    class Solution {
        let map = [
            "2": ["a", "b", "c"],
            "3": ["d", "e", "f"],
            "4": ["g", "h", "i"],
            "5": ["j", "k", "l"],
            "6": ["m", "n", "o"],
            "7": ["p", "q", "r", "s"],
            "8": ["t", "u", "v"],
            "9": ["w", "x", "y", "z"]
        ]
        
        func letterCombinations(_ digits: String) -> [String] {
            guard !digits.isEmpty else { return [] }
            
            let numbers = digits.map { String($0) }
            
            let firstDigit = numbers[0]
            var results = [String]()
            
            for index in 0..<map[firstDigit]!.count {
                dfs(string: map[firstDigit]![index], numbers: numbers, results: &results)
            }
            
            return results
        }
        
        func dfs(string: String, numbers: [String], results: inout [String]) {
            if string.count == numbers.count {
                results.append(string)
                return
            } else {
                let digit = numbers[string.count]
                for index in 0..<map[digit]!.count {
                    let newString = string + map[digit]![index]
                    dfs(string: newString, numbers: numbers, results: &results)
                }
            }
        }
    }
}

extension LetterCombinationsOfAPhoneNumber.Solution: SolutionProtocol {
    var testCases: [Validatable] {
        return [
            TestCase1(input1: "23", result: ["ad","ae","af","bd","be","bf","cd","ce","cf"], func1: self.letterCombinations),
            TestCase1(input1: "", result: [], func1: self.letterCombinations),
            TestCase1(input1: "29", result: ["aw","ax","ay","az", "bw","bx","by","bz", "cw","cx","cy","cz"], func1: self.letterCombinations)
        ]
    }
}
