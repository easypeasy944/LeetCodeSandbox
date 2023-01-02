//
//  27. Remove Element.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 25.08.2022.
//

import Foundation

enum RemoveElement {
    
    class Solution {
        func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
            let result = _removeElement(nums, val)
            nums = result.value1
            return result.value2
        }
        
        func _removeElement(_ nums: [Int], _ val: Int) -> Result2<[Int], Int> {
            if nums.isEmpty {
                return Result2(value1: nums, value2: 0)
            }
            
            if nums.count == 1 {
                if nums[0] == val { return Result2(value1: nums, value2: 0) }
                else { return Result2(value1: nums, value2: 1) }
            }
            
            var nums = nums
            
            var leftCursor: Int = 0
            var rightCursor: Int = nums.count - 1
            var count: Int = 0
            
            while true {
                while rightCursor >= 0 && nums[rightCursor] == val {
                    rightCursor -= 1
                }
                
                if rightCursor - leftCursor == 1 || leftCursor == rightCursor  {
                    if rightCursor >= 0 && nums[leftCursor] == val {
                        nums[leftCursor] = nums[rightCursor]
                        rightCursor -= 1
                    }
                    
                    count = rightCursor + 1
                    break
                } else if rightCursor - leftCursor > 1 {
                    if rightCursor >= 0 && nums[leftCursor] == val {
                        nums[leftCursor] = nums[rightCursor]
                        rightCursor -= 1
                    }
                    
                    leftCursor += 1
                } else {
                    count = leftCursor
                    break
                }
            }
            
            return Result2(value1: nums, value2: count)
        }
    }
}

extension RemoveElement.Solution: SolutionProtocol {
    var testCases: [Validatable] {
        let comparator: (Result2<[Int], Int>, Result2<[Int], Int>) -> Bool = { result1, result2 -> Bool in
            guard result1.value2 == result2.value2 else { return false }
            return result1.value1[0..<result1.value2] == result2.value1[0..<result2.value2]
        }
        
        return [
            TestCase2(input1: [1], input2: 2, result: Result2(value1: [1], value2: 1), func2: self._removeElement, comparator: comparator),
            TestCase2(input1: [1], input2: 1, result: Result2(value1: [1], value2: 0), func2: self._removeElement, comparator: comparator),
            TestCase2(input1: [3, 3], input2: 3, result: Result2(value1: [3, 3], value2: 0), func2: self._removeElement, comparator: comparator),
            TestCase2(input1: [4, 5], input2: 5, result: Result2(value1: [4, 5], value2: 1), func2: self._removeElement, comparator: comparator),
            TestCase2(input1: [0,1,2,2,3,0,4,2], input2: 2, result: Result2(value1: [0, 1, 4, 0, 3, 2, 2, 2], value2: 5), func2: self._removeElement, comparator: comparator),
            TestCase2(input1: [0,1,2,2,3,0,4], input2: 2, result: Result2(value1: [0, 1, 4, 0, 3, 2, 2], value2: 5), func2: self._removeElement, comparator: comparator),
            TestCase2(input1: [0,0,0,2,0,0,0,0], input2: 2, result: Result2(value1: [0, 0, 0, 0, 0, 0, 0, 2], value2: 7), func2: self._removeElement, comparator: comparator),
            TestCase2(input1: [0,0,0,0,0,0,0,0], input2: 2, result: Result2(value1: [0, 0, 0, 0, 0, 0, 0, 0], value2: 8), func2: self._removeElement, comparator: comparator),
        ]
    }
}

