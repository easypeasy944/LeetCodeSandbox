//
//  45. Jump Game II.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 10.12.2022.
//

import Foundation

enum JumpGameII {
    
    class Solution {
        struct Value: Hashable {
            let index: Int
            let count: Int
        }
        
        func jump(_ nums: [Int]) -> Int {
            var count: Int = 0
            var sum: Int = 0
            var values = Set<Value>()
            
            for index in (0..<nums.count - 1).reversed() {
                let length = nums.count - 1 - index
                
                if nums[index] >= length {
                    count = 1
                    sum = nums[index]
                    values.insert(Value(index: index, count: 1))
                } else if nums[index] + sum >= length {
                    var localMin: Int = length
                    for value in values {
                        if nums[index] >= value.index - index {
                            localMin = min(localMin, value.count + 1)
                        }
                    }
                    values.insert(Value(index: index, count: localMin))
                    sum += nums[index]
                    count = localMin
                }
            }
            
            return count
        }
    }
}

extension JumpGameII.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [1,2,1,1,1], result: 3, func1: self.jump),
            TestCase1(input1: [10,1,2,0,3,1,1,4], result: 1, func1: self.jump),
            TestCase1(input1: [2,3,0,1,4], result: 2, func1: self.jump),
            TestCase1(input1: [2,3,1,1,4], result: 2, func1: self.jump),
        ]
    }
}
