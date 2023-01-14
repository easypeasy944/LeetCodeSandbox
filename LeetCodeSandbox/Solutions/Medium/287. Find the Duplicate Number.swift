//
//  287. Find the Duplicate Number.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 14.01.2023.
//

import Foundation

enum FindTheDuplicateNumber {
    
    class Solution {
        func findDuplicate(_ nums: [Int]) -> Int {
            var l = 1
            var r = nums.count - 1
            
            while l < r {
                let mid = l + (r - l) / 2
                var count = 0
                
                nums.forEach {
                    if $0 <= mid {
                        count += 1
                    }
                }
                
                if count <= mid {
                    l = mid + 1
                } else {
                    r = mid
                }
            }
            
            return l
        }
    }
}

extension FindTheDuplicateNumber.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [1,3,4,2,1], result: 1, func1: self.findDuplicate),
            TestCase1(input1: [2,2,2,2,3], result: 2, func1: self.findDuplicate),
            TestCase1(input1: [2,2,2,2,2], result: 2, func1: self.findDuplicate),
            TestCase1(input1: [1,3,4,2,2], result: 2, func1: self.findDuplicate),
            TestCase1(input1: [3,1,3,4,2], result: 3, func1: self.findDuplicate),
            TestCase1(input1: [1,1], result: 1, func1: self.findDuplicate),
        ]
    }
}
