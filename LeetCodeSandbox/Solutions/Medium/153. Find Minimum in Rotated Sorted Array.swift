//
//  153. Find Minimum in Rotated Sorted Array.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 03.12.2022.
//

import Foundation

enum FindMinimumInRotatedSortedArray {
    
    class Solution {
        func findMin(_ nums: [Int]) -> Int {
            if nums[0] <= nums[nums.count - 1] {
                return nums[0]
            }
            let min = find(nums: nums, startIndex: 0, endIndex: nums.count - 1)
            return min
        }
        
        private func find(nums: [Int], startIndex: Int, endIndex: Int) -> Int {
            if endIndex - startIndex == 1 {
                return min(nums[startIndex], nums[endIndex])
            }
            if startIndex == endIndex {
                return nums[startIndex]
            }
            
            let midIndex = startIndex + (endIndex - startIndex) / 2
            
            if nums[startIndex] > nums[midIndex] {
                return find(nums: nums, startIndex: startIndex, endIndex: midIndex)
            } else {
                return find(nums: nums, startIndex: midIndex, endIndex: endIndex)
            }
        }
    }
}

extension FindMinimumInRotatedSortedArray.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
//            TestCase1(input1: [4,5,6,7,0,1,2], result: 0, func1: self.findMin),
//            TestCase1(input1: [2,2,2,2], result: 2, func1: self.findMin),
//            TestCase1(input1: [0], result: 0, func1: self.findMin),
//            TestCase1(input1: [1,2,3,4], result: 1, func1: self.findMin),
            TestCase1(input1: [11,13,15,17], result: 11, func1: self.findMin),
        ]
    }
}
