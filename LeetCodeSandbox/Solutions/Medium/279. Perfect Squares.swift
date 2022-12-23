//
//  279. Perfect Squares.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 23.12.2022.
//

import Foundation

enum PerfectSquares {
    
    class Solution {
        var cache: [Int: Int] = [:]
        
        func numSquares(_ n: Int) -> Int {
            cache[1] = 1
            let min = find(n)
            return min
        }
        
        func find(_ n: Int) -> Int {
            if let value = cache[n] {
                return value
            } else {
                let sqrtValue = sqrt(Double(n))
                if sqrtValue == floor(sqrtValue) {
                    cache[n] = 1
                    return 1
                } else {
                    var minNum: Int = .max

                    for i in 1...Int(sqrt(Double(n/2))) {
                        minNum = min(
                            minNum,
                            find(n - i * i)
                        )
                    }
                    
                    cache[n] = minNum + 1
                    return minNum + 1
                }
            }
        }
    }
}

extension PerfectSquares.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: 12, result: 3, func1: self.numSquares),
            TestCase1(input1: 20, result: 2, func1: self.numSquares),
            TestCase1(input1: 1, result: 1, func1: self.numSquares)
        ]
    }
}
