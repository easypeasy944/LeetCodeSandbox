//
//  238. Product of Array Except Self.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 03.12.2022.
//

import Foundation

enum ProductOfArrayExceptSelf {
    
    class Solution {
        func productExceptSelf(_ nums: [Int]) -> [Int] {
            var result: [Int] = Array(repeating: 1, count: nums.count)
            
            var currentMuliply: Int = nums[0]
            for i in 1..<nums.count {
                result[i] *= currentMuliply
                currentMuliply *= nums[i]
            }
            
            currentMuliply = nums[nums.count - 1]
            for i in (0...nums.count - 2).reversed() {
                result[i] *= currentMuliply
                currentMuliply *= nums[i]
            }
            
            return result
        }

    }
}

extension ProductOfArrayExceptSelf.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [1,2,3,4], result: [24,12,8,6], func1: self.productExceptSelf),
            TestCase1(input1: [-1,1,0,-3,3], result: [0,0,9,0,0], func1: self.productExceptSelf),
            TestCase1(input1: [-1,0,0,-3,3], result: [0,0,0,0,0], func1: self.productExceptSelf),
            TestCase1(input1: [-1,0,0,-3,-3], result: [0,0,0,0,0], func1: self.productExceptSelf),
            TestCase1(input1: [-1,2], result: [2,-1], func1: self.productExceptSelf),
        ]
    }
}
