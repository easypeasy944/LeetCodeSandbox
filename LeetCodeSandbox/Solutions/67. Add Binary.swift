//
//  67. Add Binary.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 28.08.2022.
//

import Foundation

enum AddBinary {
    
    class Solution {
        func addBinary(_ a: String, _ b: String) -> String {
            var carry: Int = 0
            var result: String = ""
            
            for i in 0..<max(a.count, b.count) {
                let first = a[a.count - 1 - i].flatMap(Int.init) ?? 0
                let second = b[b.count - 1 - i].flatMap(Int.init) ?? 0
                
                let sum = self.sum(a: first, b: second, carry: &carry)
                result = "\(sum)\(result)"
            }
            
            if carry != 0 {
                result = "\(carry)\(result)"
            }
            
            return result
        }
        
        func sum(a: Int, b: Int, carry: inout Int) -> Int {
            switch a + b + carry {
            case 0:
                carry = 0
                return 0
            case 1:
                carry = 0
                return 1
            case 2:
                carry = 1
                return 0
            case 3:
                carry = 1
                return 1
            default:
                fatalError()
            }
        }
    }
}

extension AddBinary.Solution: SolutionProtocol {
    var testCases: [Validatable] {
        return [
            TestCase2(input1: "0", input2: "0", result: "0", func2: self.addBinary),
            TestCase2(input1: "11", input2: "1", result: "100", func2: self.addBinary),
            TestCase2(input1: "1010", input2: "1011", result: "10101", func2: self.addBinary),
        ]
    }
}
