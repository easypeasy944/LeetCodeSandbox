//
//      .swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 22.01.2023.
//

import Foundation

enum CountingBits {
    
    class Solution {
        func countBits(_ n: Int) -> [Int] {
            var result: [Int] = Array(repeating: 0, count: n + 1)
            
            for i in 0...n {
                var mask = 1 << 17
                var count: Int = 0
                
                for _ in 0...17 {
                    if i & mask == mask {
                        count += 1
                    }
                    mask = mask >> 1
                }
                
                result[i] = count
            }
            
            return result
        }
    }
}

extension CountingBits.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: 2, result: [0,1,1], func1: self.countBits),
            TestCase1(input1: 17, result: [0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3, 3, 4, 1, 2], func1: self.countBits)
        ]
    }
}
