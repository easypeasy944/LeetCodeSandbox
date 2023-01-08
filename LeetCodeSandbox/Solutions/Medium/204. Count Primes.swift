//
//  204. Count Primes.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 08.01.2023.
//

import Foundation

enum CountPrimes {
    
    class Solution {
        func countPrimes(_ n: Int) -> Int {
            guard n > 2 else { return 0 }
            
            var array = Array(2..<n)
            var pointer: Int = 0
            var count = 0
            
            while pointer < n - 2 {
                count += 1
                var i = pointer + array[pointer]
                
                while i < n - 2 {
                    array[i] = 0
                    i += array[pointer]
                }
                
                pointer += 1
                while pointer < n - 2 && array[pointer] == 0 { pointer += 1 }
            }
            
            return count
        }
    }
}

extension CountPrimes.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: 2, result: 0, func1: self.countPrimes),
            TestCase1(input1: 3, result: 1, func1: self.countPrimes),
            TestCase1(input1: 10, result: 4, func1: self.countPrimes),
            TestCase1(input1: 20, result: 8, func1: self.countPrimes),
            TestCase1(input1: 50, result: 15, func1: self.countPrimes),
        ]
    }
}
