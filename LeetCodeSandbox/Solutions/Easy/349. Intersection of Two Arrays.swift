//
//  349. Intersection of Two Arrays.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 27.12.2022.
//

import Foundation

enum IntersectionOfTwoArrays {
    
    class Solution {
        func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
            let sortedNums1 = nums1.sorted(by: <)
            let sortedNums2 = nums2.sorted(by: <)
            
            var i: Int = 0
            var j: Int = 0
            
            var result: [Int] = []
            
            while i < sortedNums1.count && j < sortedNums2.count {
                if sortedNums1[i] == sortedNums2[j] {
                    let value = sortedNums1[i]
                    result.append(value)
                    
                    while i < sortedNums1.count && sortedNums1[i] == value { i += 1 }
                    while j < sortedNums2.count && sortedNums2[j] == value { j += 1 }
                } else if sortedNums1[i] < sortedNums2[j] {
                    while i < sortedNums1.count && sortedNums1[i] < sortedNums2[j] { i += 1 }
                } else {
                    while j < sortedNums2.count && sortedNums2[j] < sortedNums1[i] { j += 1 }
                }
            }
            
            return result
        }
    }
}

extension IntersectionOfTwoArrays.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase2(input1: [4,9,5], input2: [9,4,9,8,4], result: [4,9], func2: self.intersection),
            TestCase2(input1: [1,2,2,1], input2: [2,2], result: [2], func2: self.intersection)
        ]
    }
}
