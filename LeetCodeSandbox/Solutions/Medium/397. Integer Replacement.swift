//
//  397. Integer Replacement.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 25.01.2023.
//

import Foundation

enum IntegerReplacement {
    
    class Solution {
        var map: [Int: Int] = [:]
        
        func integerReplacement(_ n: Int) -> Int {
            map = [1: 0]
            return find(n: n)
        }
        
        func find(n: Int) -> Int {
            if let value = map[n] {
                return value
            }
            
            let result: Int
            
            if n % 2 == 0 {
                result = find(n: n / 2)
            } else {
                result = min(
                    find(n: n - 1),
                    find(n: n + 1)
                )
            }
            
            map[n] = result + 1
            return result + 1
        }
        
        /*
         
         func integerReplacement(_ n: Int) -> Int {
             return find(n: n, count: 0)
         }
         
         func find(n: Int, count: Int) -> Int {
             if n == 1 { return count }
             
             if n % 2 == 0 {
                 return find(n: n / 2, count: count + 1)
             } else {
                 return min(
                     find(n: n - 1, count: count + 1),
                     find(n: n + 1, count: count + 1)
                 )
             }
         }
         */
    }
}

extension IntegerReplacement.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: 8, result: 3, func1: self.integerReplacement),
            TestCase1(input1: 100, result: 8, func1: self.integerReplacement),
        ]
    }
}
