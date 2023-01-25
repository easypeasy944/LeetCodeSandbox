//
//  443. String Compression.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 25.01.2023.
//

import Foundation

enum StringCompression {
    
    class Solution {
        func compress(_ chars: inout [Character]) -> Int {
            var pointer: Int = 1
            var count: Int = 1
            
            while pointer != chars.count {
                if chars[pointer] == chars[pointer - 1] {
                    pointer += 1
                    count += 1
                } else {
                    if count != 1 {
                        let number = Array(String(count))
                        chars.insert(contentsOf: number, at: pointer)
                        chars.removeSubrange(pointer - count + 1..<pointer)
                        pointer = pointer + number.count - count + 1
                        pointer += 1
                    } else {
                        pointer += 1
                    }
                    
                    count = 1
                }
            }
            
            if count != 1 {
                let number = Array(String(count))
                chars.insert(contentsOf: number, at: pointer)
                chars.removeSubrange(pointer - count + 1..<pointer)
            }
            
            return chars.count
        }
        
        func _compress(_ chars: [Character]) -> [Character] {
            var chars = chars
            _ = compress(&chars)
            return chars
        }
    }
}

extension StringCompression.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: ["a","a","b","b","c","c","c"], result: ["a","2","b","2","c","3"], func1: self._compress),
            TestCase1(input1: ["a"], result: ["a"], func1: self._compress),
            TestCase1(input1: ["a","b","b","b","b","b","b","b","b","b","b","b","b"], result: ["a","b","1","2"], func1: self._compress),
        ]
    }
}
