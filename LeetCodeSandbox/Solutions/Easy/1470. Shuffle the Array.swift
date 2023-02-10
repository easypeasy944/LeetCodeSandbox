//
//  1470. Shuffle the Array.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 10.02.2023.
//

import Foundation

enum ShuffleTheArray {
    
    class Solution {
        func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
            var array = Array(repeating: 0, count: 2 * n)
            
            for i in 0..<n {
                array[2 * i] = nums[i]
                array[2 * i + 1] = nums[n + i]
            }
            
            return array
        }
    }
}

extension ShuffleTheArray.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase2(input1: [2,5,1,3,4,7], input2: 3, result: [2,3,5,4,1,7], func2: self.shuffle),
            TestCase2(input1: [1,2,3,4,4,3,2,1], input2: 4, result: [1,4,2,3,3,2,4,1], func2: self.shuffle),
            TestCase2(input1: [1,1,2,2], input2: 2, result: [1,2,1,2], func2: self.shuffle),
        ]
    }
}
