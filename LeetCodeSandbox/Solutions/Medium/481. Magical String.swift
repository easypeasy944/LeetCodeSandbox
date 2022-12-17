//
//  481. Magical String.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 17.12.2022.
//

import Foundation

enum MagicalString {
    
    class Solution {
        func magicalString(_ n: Int) -> Int {
            if n <= 3 {
                return 1
            }
            
            var str: [Character] = Array(repeating: "0", count: n + 1)
            str[0] = "1"
            str[1] = "2"
            str[2] = "2"
            
            var pointer: Int = 2
            var count: Int = 1
            var writeIndex: Int = 3
            
            while writeIndex < n {
                if str[str.index(str.startIndex, offsetBy: pointer)] == "2" {
                    if str[writeIndex - 1] == "2" {
                        count += min(2, n - writeIndex)
                        str[writeIndex] = "1"
                        str[writeIndex + 1] = "1"
                    } else {
                        str[writeIndex] = "2"
                        str[writeIndex + 1] = "2"
                    }
                    writeIndex += 2
                } else {
                    if str[writeIndex - 1] == "2" {
                        count += min(1, n - writeIndex)
                        str[writeIndex] = "1"
                    } else {
                        str[writeIndex] = "2"
                    }
                    writeIndex += 1
                }
                pointer += 1
            }
            
            return count
        }
    }
}

extension MagicalString.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: 15000, result: 7501, func1: self.magicalString),
            TestCase1(input1: 7, result: 4, func1: self.magicalString),
            TestCase1(input1: 6, result: 3, func1: self.magicalString),
            TestCase1(input1: 1, result: 1, func1: self.magicalString),
            TestCase1(input1: 18, result: 9, func1: self.magicalString),
        ]
    }
}
