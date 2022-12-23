//
//  189. Rotate Array.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 23.12.2022.
//

import Foundation

enum RotateArray {
    
    class Solution {
        func rotate(_ nums: inout [Int], _ k: Int) {
            if k % nums.count == 0 {
                return
            }
            
            var shift = nums.count - (k % nums.count)
            var array = nums[0..<shift]
            
            for i in shift..<nums.count {
                nums[i - shift] = nums[i]
            }
            
            for i in (k % nums.count)..<nums.count {
                nums[i] = array[i - (k % nums.count)]
            }
        }
        
        func _rotate(_ nums: [Int], _ k: Int) -> [Int] {
            var _nums = nums
            rotate(&_nums, k)
            return _nums
        }
    }
}

extension RotateArray.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase2(input1: [1,2], input2: 3, result: [2,1], func2: self._rotate),
            TestCase2(input1: [1,2,3,4,5,6,7], input2: 3, result: [5,6,7,1,2,3,4], func2: self._rotate),
            TestCase2(input1: [1,2,3,4,5,6,7], input2: 7, result: [1,2,3,4,5,6,7], func2: self._rotate),
            TestCase2(input1: [1,2,3,4,5,6,7], input2: 6, result: [2,3,4,5,6,7,1], func2: self._rotate)
        ]
    }
}
