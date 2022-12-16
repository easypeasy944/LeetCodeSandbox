//
//  26. Remove Duplicates from Sorted Array.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 16.12.2022.
//

import Foundation

enum RemoveDuplicatesFromSortedArray {
    
    class Solution {
        struct Result: Equatable {
            let nums: [Int]
            let k: Int
        }
        
        func removeDuplicates(_ nums: inout [Int]) -> Int {
            var current: Int = nums[0]
            var writeIndex: Int = 1
            
            for i in 1..<nums.count {
                if nums[i] == current {
                    continue
                } else {
                    current = nums[i]
                    swap(&nums, i, writeIndex)
                    writeIndex += 1
                }
            }
            
            return writeIndex
        }
        
        func _removeDuplicates(_ nums: [Int]) -> Result {
            var nums = nums
            let k = removeDuplicates(&nums)
            return Result(nums: Array(nums[0..<k]), k: k)
        }
        
        func swap(_ nums: inout [Int], _ lhsIndex: Int, _ rhsIndex: Int) {
            let temp = nums[lhsIndex]
            nums[lhsIndex] = nums[rhsIndex]
            nums[rhsIndex] = temp
        }
    }
}

extension RemoveDuplicatesFromSortedArray.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(
                input1: [0,0,1,1,1,2,2,3,3,4],
                result: Result(nums: [0,1,2,3,4], k: 5),
                func1: self._removeDuplicates
            ),
            TestCase1(
                input1: [0],
                result: Result(nums: [0], k: 1),
                func1: self._removeDuplicates
            ),
            TestCase1(
                input1: [1,2],
                result: Result(nums: [1,2], k: 2),
                func1: self._removeDuplicates
            ),
            TestCase1(
                input1: [2,2],
                result: Result(nums: [2], k: 1),
                func1: self._removeDuplicates
            ),
        ]
    }
}
