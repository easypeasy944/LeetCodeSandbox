//
//  179. Largest Number.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 11.12.2022.
//

import Foundation

enum LargestNumber {
    
    class Solution {
        func largestNumber(_ nums: [Int]) -> String {
            var strings = nums.map(String.init)
            strings.sort { lhs, rhs in
                Int(lhs + rhs)! > Int(rhs + lhs)!
            }
            
            var result = strings.joined()
            while result.count > 1 && result.first == "0" {
                result = String(result.dropFirst())
            }
            return result
        }
    }
}

extension LargestNumber.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [0,00], result: "0", func1: self.largestNumber),
            TestCase1(input1: [3,30,34,5,9], result: "9534330", func1: self.largestNumber),
        ]
    }
}
