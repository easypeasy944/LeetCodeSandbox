//
//  303. Range Sum Query - Immutable.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 08.01.2023.
//

import Foundation

enum RangeSumQuery_Immutable {
    
    class NumArray {
        private var sum: [Int] = []
        
        init(_ nums: [Int]) {
            var currentSum: Int = 0
            for i in 0..<nums.count {
                currentSum += nums[i]
                sum.append(currentSum)
            }
        }
        
        func sumRange(_ left: Int, _ right: Int) -> Int {
            var currentSum = sum[right]
            if left > 0 {
                currentSum -= sum[left - 1]
            }
            return currentSum
        }
    }
    
    class Solution {
        enum Action {
            case initialize([Int])
            case sum(Int, Int)
        }
        enum Result: Equatable {
            case initialize
            case sum(Int)
        }
        
        func run(_ actions: [Action]) -> [Result] {
            var array: NumArray!
            return actions.map {
                switch $0 {
                case .initialize(let nums):
                    array = NumArray(nums)
                    return .initialize
                    
                case let .sum(l, r):
                    return .sum(array.sumRange(l, r))
                }
            }
        }
    }
}

extension RangeSumQuery_Immutable.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(
                input1: [
                    .initialize([-2,0,3,-5,2,-1]),
                    .sum(0,2),
                    .sum(2,5),
                    .sum(0,5)
                ],
                result: [
                    .initialize,
                    .sum(1),
                    .sum(-1),
                    .sum(-3)
                ],
                func1: self.run)
        ]
    }
}
