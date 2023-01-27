//
//  80. Remove Duplicates from Sorted Array II.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 27.01.2023.
//

import Foundation

enum RemoveDuplicatesFromSortedArrayII {
    
    class Solution {
        func removeDuplicates(_ nums: inout [Int]) -> Int {
            var l: Int = 0
            var r: Int = 0
            
            while r < nums.count {
                let current = nums[r]
                nums[l] = current
                l += 1
                
                if r + 1 < nums.count && nums[r + 1] == current {
                    nums[l] = nums[r + 1]
                    l += 1
                }
                
                while r < nums.count && nums[r] == current {
                    r += 1
                }
            }
            
            return l
        }
        
        func run(_ nums: [Int]) -> [Int] {
            var _nums = nums
            let length = removeDuplicates(&_nums)
            return Array(_nums[0..<length])
        }
    }
}

extension RemoveDuplicatesFromSortedArrayII.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [0,0,1,1,1,1,2,3,3], result: [0,0,1,1,2,3,3], func1: self.run),
            TestCase1(input1: [1,1,1,2,2,3], result: [1,1,2,2,3], func1: self.run),
        ]
    }
}
