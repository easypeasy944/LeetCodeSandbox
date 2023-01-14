//
//  55. Jump Game.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 14.01.2023.
//

import Foundation

enum JumpGame {
    
    class Solution {
        func canJump(_ nums: [Int]) -> Bool {
            var r: Int = 0
            
            for i in 0..<(nums.count - 1) {
                r = max(r, i + nums[i])
                
                if r <= i {
                    return false
                }
            }
            
            return r >= nums.count - 1
        }
    }
}

extension JumpGame.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [0,2,3], result: false, func1: self.canJump),
            TestCase1(input1: [2,3,1,1,4], result: true, func1: self.canJump),
            TestCase1(input1: [3,2,1,0,4], result: false, func1: self.canJump),
        ]
    }
}
