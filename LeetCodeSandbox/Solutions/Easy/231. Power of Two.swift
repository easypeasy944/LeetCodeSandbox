//
//  231. Power of Two.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 22.01.2023.
//

import Foundation

enum PowerOfTwo {
    
    class Solution {
        func isPowerOfTwo(_ n: Int) -> Bool {
            n > 0 && n & (n - 1) == 0
        }
    }
}

extension PowerOfTwo.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: 16, result: true, func1: self.isPowerOfTwo),
            TestCase1(input1: 7, result: false, func1: self.isPowerOfTwo),
            TestCase1(input1: .max, result: false, func1: self.isPowerOfTwo),
            TestCase1(input1: .min, result: false, func1: self.isPowerOfTwo),
        ]
    }
}
