//
//  496. Next Greater Element I.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 16.01.2023.
//

import Foundation

enum NextGreaterElementI {
    
    class Solution {
        func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
            var stack = Stack<Int>()
            var map: [Int: Int] = [:]
            
            for num in nums2 {
                while let topValue = stack.top(), topValue < num {
                    map[topValue] = num
                    _ = stack.pop()
                }
                stack.push(num)
            }
            
            var result: [Int] = Array(repeating: -1, count: nums1.count)
            for i in 0..<nums1.count {
                result[i] = map[nums1[i], default: -1]
            }
            
            return result
        }
    }
}

extension NextGreaterElementI.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase2(input1: [4,1,2], input2: [1,3,4,2], result: [-1,3,-1], func2: self.nextGreaterElement),
            TestCase2(input1: [2,4], input2: [1,2,3,4], result: [3,-1], func2: self.nextGreaterElement),
        ]
    }
}
