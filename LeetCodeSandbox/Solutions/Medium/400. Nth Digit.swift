//
//  400. Nth Digit.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 25.12.2022.
//

import Foundation

enum NthDigit {
    
    class Solution {
        func findNthDigit(_ n: Int) -> Int {
            guard n >= 10 else {
                return n
            }
            
            let goldenResult = self.goldenResult(n)
            
            var k: Int = 0
            var sum: Int = 0
            var lastNumber: Int = 0
            
            while sum < n {
                k += 1
                let numbersCount = Int(pow(10.0, Double(k))) - Int(pow(10.0, Double(k - 1)))
                let result = numbersCount * k
                lastNumber = sum
                sum += result
            }
            
            let offsetInNumbers = Int(ceil(Double(n - lastNumber) / Double(k)))
            let offset: Int
            if (n - lastNumber) % k == 0 {
                offset = k - 1
            } else {
                offset = (n - lastNumber) % k - 1
            }
            
            let number = Int(pow(10.0, Double(k - 1))) + offsetInNumbers - 1
            
            let stringNumber = String(number)
            let digit = String(stringNumber[stringNumber.index(stringNumber.startIndex, offsetBy: offset)])
            return Int(digit)!
        }
        
        func goldenResult(_ n: Int) -> [Int] {
            func split(_ n: Int) -> [Int] {
                let str = String(n)
                return str.map { Int(String($0))! }
            }
            
            let result = (1...n).flatMap(split)
            return result
        }
    }
}

extension NthDigit.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: 3, result: 3, func1: self.findNthDigit),
            TestCase1(input1: 11, result: 0, func1: self.findNthDigit),
            TestCase1(input1: 15, result: 2, func1: self.findNthDigit),
            TestCase1(input1: 200, result: 0, func1: self.findNthDigit),
            TestCase1(input1: 1000, result: 3, func1: self.findNthDigit),
        ]
    }
}
