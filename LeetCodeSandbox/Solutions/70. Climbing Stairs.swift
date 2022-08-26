//
//  70. Climbing Stairs.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 26.08.2022.
//

import Foundation

enum ClimbingStairs {
    
    class Solution {
        func climbStairs(_ n: Int) -> Int {
            var map: [Int: Int] = [:]
            
            map[1] = 1
            map[2] = 2
            map[3] = 3
            
            return getVariants(number: n, map: &map)
        }
        
        func getVariants(number: Int, map: inout [Int: Int]) -> Int {
            if let variants = map[number] {
                return variants
            } else {
                let variants = getVariants(number: number - 1, map: &map) + getVariants(number: number - 2, map: &map)
                map[number] = variants
                return variants
            }
        }
    }
}

extension ClimbingStairs.Solution: SolutionProtocol {
    var testCases: [Validatable] {
        return [
            TestCase1(input1: 2, result: 2, func1: self.climbStairs),
            TestCase1(input1: 3, result: 3, func1: self.climbStairs),
            TestCase1(input1: 5, result: 8, func1: self.climbStairs),
            TestCase1(input1: 44, result: 1134903170, func1: self.climbStairs),
        ]
    }
}
