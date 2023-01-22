//
//  1720. Decode XORed Array.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 22.01.2023.
//

import Foundation

enum DecodeXORedArray {
    
    class Solution {
        func decode(_ encoded: [Int], _ first: Int) -> [Int] {
            var result: [Int] = Array(repeating: 0, count: encoded.count + 1)
            result[0] = first
            
            for i in 0..<encoded.count {
                result[i + 1] = result[i] ^ encoded[i]
            }
            
            return result
        }
    }
}

extension DecodeXORedArray.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase2(input1: [1,2,3], input2: 1, result: [1,0,2,1], func2: self.decode)
        ]
    }
}
