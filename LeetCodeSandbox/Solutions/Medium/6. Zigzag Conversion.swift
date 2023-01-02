//
//  6. Zigzag Conversion.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 20.08.2022.
//

import Foundation

enum ZigzagConversion {
    
    class Solution {
        func convert(_ s: String, _ numRows: Int) -> String {
            var addition: Int = 1
            var map: [Int: String] = [:]
            var row: Int = 0
            
            for i in 0..<s.count {
                let character = s[s.index(s.startIndex, offsetBy: i)]
                map[row, default: ""] += String(character)
                
                if numRows == 1 { continue }
                
                if row + addition == numRows {
                    addition = -1
                    row += addition
                } else if row + addition < 0 {
                    addition = 1
                    row += addition
                } else {
                    row += addition
                }
            }
            
            var result: String = ""
            for row in 0..<map.count {
                result += map[row]!
            }
            return result
        }
    }
}

extension ZigzagConversion.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase2(input1: "PAYPALISHIRING", input2: 3, result: "PAHNAPLSIIGYIR", func2: self.convert),
            TestCase2(input1: "1", input2: 1, result: "1", func2: self.convert),
            TestCase2(input1: "ABCD", input2: 4, result: "ABCD", func2: self.convert),
            TestCase2(input1: "SsS", input2: 2, result: "SSs", func2: self.convert),
            TestCase2(input1: "AB", input2: 1, result: "AB", func2: self.convert),
        ]
    }
}
