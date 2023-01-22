//
//  43. Multiply Strings.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 22.01.2023.
//

import Foundation

enum MultiplyStrings {
    
    class Solution {
        func multiply(_ num1: String, _ num2: String) -> String {
            if num2 == "0" || num1 == "0" { return "0" }
            if num2 == "1" { return num1 }
            if num1 == "1" { return num2 }
            
            let n1 = num1.map { Int(String($0))! }
            let n2 = num2.map { Int(String($0))! }
            
            var result: [Int] = []
            
            for i in (0..<num2.count) {
                let digit = n2[n2.count - i - 1]
                
                var temp: [Int] = []
                var carry: Int = 0
                
                for j in (0..<num1.count) {
                    let value = n1[n1.count - j - 1] * digit + carry
                    temp.insert(value % 10, at: 0)
                    carry = value / 10
                }
                
                if carry != 0 {
                    temp.insert(carry, at: 0)
                }
                
                temp.append(contentsOf: Array(repeating: 0, count: i))
                
                result = _sum(result, temp)
            }
            
            return String(result.drop(while: { $0 == 0 }).map({ String($0) }).joined())
        }
        
        func _sum(_ num1: [Int], _ num2: [Int]) -> [Int] {
            var array1 = num1
            var array2 = num2
            
            if array1.count > array2.count {
                array2.insert(contentsOf: Array(repeating: 0, count: array1.count - array2.count), at: 0)
            } else if array2.count > array1.count {
                array1.insert(contentsOf: Array(repeating: 0, count: array2.count - array1.count), at: 0)
            }
            
            var result: [Int] = []
            var carry: Int = 0
            
            for (n1, n2) in zip(array1, array2).reversed() {
                let value = n1 + n2 + carry
                result.insert(value % 10, at: 0)
                carry = value / 10
            }
            
            if carry != 0 {
                result.insert(carry, at: 0)
            }
            
            return result
        }
    }
}

extension MultiplyStrings.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase2(input1: "21", input2: "49", result: "1029", func2: self.multiply(_:_:)),
            TestCase2(input1: "45673453", input2: "124010000", result: "5663964906530000", func2: self.multiply(_:_:)),
            TestCase2(input1: "2", input2: "3", result: "6", func2: self.multiply(_:_:)),
        ]
    }
}
