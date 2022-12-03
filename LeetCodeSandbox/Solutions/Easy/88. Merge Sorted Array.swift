//
//  88. Merge Sorted Array.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 03.12.2022.
//

import Foundation

enum MergeSortedArray {
    
    class Solution {
        func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
            var leftPointer = 0
            var rightPointer = 0
            
            for index in 0..<m {
                nums1[m + n - index - 1] = nums1[m - 1 - index]
            }
            
            for index in 0..<nums1.count {
                if rightPointer == n || leftPointer < m && nums1[n + leftPointer] <= nums2[rightPointer] {
                    nums1[index] = nums1[n + leftPointer]
                    leftPointer += 1
                } else {
                    if leftPointer == m || rightPointer < n && nums2[rightPointer] <= nums1[n + leftPointer] {
                        nums1[index] = nums2[rightPointer]
                        rightPointer += 1
                    }
                }
            }
        }
        
        private func _merge(_ nums1: [Int], _ m: Int, _ nums2: [Int], _ n: Int) -> [Int] {
            var result = nums1
            merge(&result, m, nums2, n)
            return result
        }
    }
}

extension MergeSortedArray.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase4(input1: [1,2,3,0,0,0], input2: 3, input3: [2,5,6], input4: 3, result: [1,2,2,3,5,6], func4: self._merge),
            TestCase4(input1: [10,11,12,0,0,0], input2: 3, input3: [2,5,6], input4: 3, result: [2,5,6,10,11,12], func4: self._merge),
            TestCase4(input1: [10,11,12,0,0,0,0], input2: 3, input3: [2,5,6,7], input4: 4, result: [2,5,6,7,10,11,12], func4: self._merge),
        ]
    }
}
