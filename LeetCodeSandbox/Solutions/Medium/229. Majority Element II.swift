//
//  229. Majority Element II.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 13.01.2023.
//

import Foundation

enum MajorityElementII {
    
    class Solution {
        func majorityElement(_ nums: [Int]) -> [Int] {
            var map: [Int: Int] = [:]
            nums.forEach { map[$0, default: 0] += 1 }
            
            return Array(map.filter { $0.value > nums.count / 3 }.keys)
        }
    }
}

extension MajorityElementII.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [3,2,3], result: [3], func1: self.majorityElement),
            TestCase1(input1: [1], result: [1], func1: self.majorityElement),
            TestCase1(input1: [1,2], result: [1,2], func1: self.majorityElement),
        ]
    }
}
