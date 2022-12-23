//
//  283. Move Zeroes.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 23.12.2022.
//

import Foundation

enum MoveZeroes {
    
    class Solution {
        func moveZeroes(_ nums: inout [Int]) {
            var i: Int = 0
            var j: Int = 0
            
            while j < nums.count {
                while i<nums.count && nums[i] != 0 {
                    i += 1
                }
                
                while j<nums.count && nums[j] == 0 {
                    j += 1
                }
                
                if i < nums.count && j < nums.count && i < j {
                    let temp = nums[i]
                    nums[i] = nums[j]
                    nums[j] = temp
                }
                
                j += 1
            }
        }
        
        func _moveZeroes(_ nums: [Int]) -> [Int] {
            var _nums = nums
            moveZeroes(&_nums)
            return _nums
        }
    }
}

extension MoveZeroes.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [0,1,0,3,12], result: [1,3,12,0,0], func1: self._moveZeroes),
            TestCase1(input1: [0,1,3,0,2], result: [1,3,2,0,0], func1: self._moveZeroes),
            TestCase1(input1: [0], result: [0], func1: self._moveZeroes),
            TestCase1(input1: [1,1,1,0,0], result: [1,1,1,0,0], func1: self._moveZeroes),
            TestCase1(input1: [1,0,2,0,3], result: [1,2,3,0,0], func1: self._moveZeroes),
        ]
    }
}
