//
//  136. Single Number.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 27.12.2022.
//

import Foundation

enum SingleNumber {
    
    class Solution {
        func singleNumber(_ nums: [Int]) -> Int {
            var val: Int = 0
            nums.forEach {
                val ^= $0
            }
            return val
        }
    }
}

extension SingleNumber.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [1,5,4,4,1,6,5], result: 6, func1: self.singleNumber)
        ]
    }
}
