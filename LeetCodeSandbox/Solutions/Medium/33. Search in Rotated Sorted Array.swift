//
//  33. Search in Rotated Sorted Array.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 24.12.2022.
//

import Foundation

enum SearchInRotatedSortedArray {
    
    class Solution {
        func search(_ nums: [Int], _ target: Int) -> Int {
            var l = 0
            var r = nums.count - 1
            
            while l <= r {
                if r - l <= 1 {
                    if nums[l] == target { return l }
                    if nums[r] == target { return r }
                    return -1
                } else {
                    let mid = l + (r - l) / 2
                    
                    if nums[l] <= nums[mid] {
                        if nums[l]...nums[mid] ~= target {
                            r = mid
                        } else {
                            l = mid
                        }
                    }
                    
                    if nums[mid] <= nums[r] {
                        if nums[mid]...nums[r] ~= target {
                            l = mid
                        } else {
                            r = mid
                        }
                    }
                }
            }
            
            return -1
        }
    }
}

extension SearchInRotatedSortedArray.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase2(input1: [4,5,6,7,0,1,2], input2: 0, result: 4, func2: self.search),
            TestCase2(input1: [0,1,2,3,4,5,6,7], input2: 0, result: 0, func2: self.search),
            TestCase2(input1: [0,1,2,3,4,5,6,7], input2: 8, result: -1, func2: self.search)
        ]
    }
}
