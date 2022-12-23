//
//  344. Reverse String.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 23.12.2022.
//

import Foundation

enum ReverseString {
    
    class Solution {
        func reverseString(_ s: inout [Character]) {
            for i in 0..<(s.count/2) {
                let temp = s[i]
                s[i] = s[s.count - 1 - i]
                s[s.count - 1 - i] = temp
            }
        }
        
        private func _reverseString(_ s: [Character]) -> [Character] {
            var _s = s
            reverseString(&_s)
            return _s
        }
    }
}

extension ReverseString.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: ["o"], result: ["o"], func1: self._reverseString),
            TestCase1(input1: ["h","e","l","l","o"], result: ["o","l","l","e","h"], func1: self._reverseString),
            TestCase1(input1: ["H","a","n","n","a","h"]
, result: ["h","a","n","n","a","H"], func1: self._reverseString),
        ]
    }
}
