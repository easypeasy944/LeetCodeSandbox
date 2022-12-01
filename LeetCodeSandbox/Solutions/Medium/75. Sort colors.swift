//
//  75. Sort colors.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 01.12.2022.
//

import Foundation

enum SortColors {
    
    class Solution {
        func sortColors(_ nums: inout [Int]) {
            guard !nums.isEmpty else { return }
            
            var leftCursor = 0
            var rightCursor = nums.count - 1
            
            func swap(_ index1: Int, _ index2: Int) {
                let temp = nums[index1]
                nums[index1] = nums[index2]
                nums[index2] = temp
            }
            
            while rightCursor - leftCursor >= 1 {
                if nums[rightCursor] < nums[leftCursor] {
                    swap(rightCursor, leftCursor)
                }
                
                if nums[rightCursor] == 2 {
                    rightCursor -= 1
                }
                if nums[leftCursor] == 0 {
                    leftCursor += 1
                }
                if nums[leftCursor] == nums[rightCursor] {
                    if rightCursor - leftCursor <= 1 {
                        return
                    }
                    var swaped: Bool = false
                    for index in (leftCursor + 1)...(rightCursor - 1) where !swaped {
                        if nums[index] < nums[leftCursor] {
                            swap(index, leftCursor)
                            swaped = true
                            continue
                        }
                        if nums[index] > nums[rightCursor] {
                            swap(index, rightCursor)
                            swaped = true
                            continue
                        }
                    }
                    if !swaped {
                        return
                    }
                }
            }
        }
        
        private func _sortColors(_ nums: [Int]) -> [Int] {
            var sortedNums = nums
            sortColors(&sortedNums)
            return sortedNums
        }
    }
}

extension SortColors.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [2,0,2,1,1,0], result: [0,0,1,1,2,2], func1: self._sortColors),
            TestCase1(input1: [2,0,1], result: [0,1,2], func1: self._sortColors),
            TestCase1(input1: [1,1,1], result: [1,1,1], func1: self._sortColors),
            TestCase1(input1: [1, 2, 1, 1, 0, 0, 1], result: [0, 0, 1, 1, 1, 1, 2], func1: self._sortColors),
        ]
    }
}
