//
//  162. Find Peak Element.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 11.12.2022.
//

import Foundation

enum FindPeakElement {
    
    class Solution {
        func findPeakElement(_ nums: [Int]) -> Int {
            let index = find(nums: nums, leftBounds: .min, rightBounds: .min, startIndex: 0, endIndex: nums.count - 1)
            return index!
        }
        
        private func find(nums: [Int], leftBounds: Int, rightBounds: Int, startIndex: Int, endIndex: Int) -> Int? {
            if startIndex == endIndex {
                if nums[startIndex] > leftBounds && nums[startIndex] > rightBounds {
                    return startIndex
                } else {
                    return nil
                }
            } else if endIndex - startIndex == 1 {
                if nums[startIndex] > leftBounds && nums[startIndex] > nums[endIndex] {
                    return startIndex
                } else if nums[endIndex] > nums[startIndex] && nums[endIndex] > rightBounds {
                    return endIndex
                } else {
                    return nil
                }
            } else {
                let middleIndex = startIndex + (endIndex - startIndex) / 2
                
                let leftIndex = find(nums: nums, leftBounds: leftBounds, rightBounds: nums[middleIndex + 1], startIndex: startIndex, endIndex: middleIndex)
                let rightIndex = find(nums: nums, leftBounds: nums[middleIndex], rightBounds: rightBounds, startIndex: middleIndex + 1, endIndex: endIndex)
                
                return leftIndex ?? rightIndex
            }
        }
    }
}

extension FindPeakElement.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [1,2,3,1], result: 2, func1: self.findPeakElement),
            TestCase1(input1: [1,2,1,3,5,6,4], result: 5, func1: self.findPeakElement),
        ]
    }
}
