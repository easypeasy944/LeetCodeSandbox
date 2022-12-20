//
//  7. Reverse Integer.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 20.12.2022.
//

import Foundation

enum ReverseInteger {
    
    class Solution {
        func reverse(_ x: Int) -> Int {
            let sign: Int = x < 0 ? -1 : 1
            
            let xString = numToString(x)
            let maxString = numToString(Int(Int32.max))
            let minString = numToString(Int(Int32.min))
            
            let boundString = sign == -1 ? minString : maxString
            let reversedString = String(xString.reversed())
            
            if reversedString.count < boundString.count {
                return sign * Int(reversedString)!
            } else if reversedString.count > boundString.count {
                return 0
            } else {
                for (x, m) in zip(reversedString, boundString) {
                    if x == m {
                        continue
                    } else if Int(String(x))! < Int(String(m))! {
                        break
                    } else {
                        return 0
                    }
                }
                return sign * Int(reversedString)!
            }
        }
        
        private func numToString(_ num: Int) -> String {
            var result: [Int] = [abs(num % 10)]
            var value = abs(num / 10)
            
            if value >= 10 {
                while value >= 10 {
                    result.insert(value % 10, at: 0)
                    value /= 10
                }
                
                result.insert(value, at: 0)
            } else {
                if value > 0 {
                    result.insert(value, at: 0)
                }
            }
                        
            return result.map { "\($0)" }.joined()
        }
    }
}

extension ReverseInteger.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: -2147483412, result: -2143847412, func1: self.reverse),
            TestCase1(input1: 1534236469, result: 0, func1: self.reverse),
            TestCase1(input1: 10, result: 1, func1: self.reverse),
            TestCase1(input1: 123, result: 321, func1: self.reverse),
            TestCase1(input1: -123, result: -321, func1: self.reverse),
            TestCase1(input1: 8, result: 8, func1: self.reverse),
            TestCase1(input1: 0, result: 0, func1: self.reverse),
            TestCase1(input1: -8, result: -8, func1: self.reverse),
            TestCase1(input1: Int.max, result: 0, func1: self.reverse),
            TestCase1(input1: Int.min, result: 0, func1: self.reverse),
        ]
    }
}
