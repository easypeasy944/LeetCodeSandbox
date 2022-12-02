//
//  42. Trapping Rain Water.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 02.12.2022.
//

import Foundation

enum TrappingRainWater {
    
    class Solution {
        func trap(_ height: [Int]) -> Int {
            var maxValue: Int = .min
            var indexes: [Int] = []
            
            for index in 0..<height.count {
                if height[index] > maxValue {
                    maxValue = height[index]
                    indexes = [index]
                } else if height[index] == maxValue {
                    indexes.append(index)
                }
            }
            
            var water: Int = 0
            
            water += calcWater(startIndex: 0, endIndex: indexes.first!, height: height, isReversed: height[0] > height[indexes.first!])
            water += calcWater(startIndex: indexes.last!, endIndex: height.count - 1, height: height, isReversed: height[indexes.last!] > height.last!)
            
            for i in 0..<(indexes.count - 1) {
                water += calcWater(startIndex: indexes[i], endIndex: indexes[i + 1], height: height, isReversed: height[i] > height[indexes[i + 1]])
            }
            
            return water
        }
        
        func calcWater(startIndex: Int, endIndex: Int, height: [Int], isReversed: Bool) -> Int {
            var water: Int = 0
            var currentWater: Int = 0
            var currentHeight: Int = 0
            
            if isReversed {
                for i in (startIndex...endIndex).reversed() {
                    if i == endIndex {
                        currentHeight = height[i]
                    } else {
                        if height[i] <= currentHeight {
                            currentWater += currentHeight - height[i]
                        } else {
                            water += currentWater
                            currentHeight = height[i]
                            currentWater = 0
                        }
                    }
                }
            } else {
                for i in startIndex...endIndex {
                    if i == startIndex {
                        currentHeight = height[i]
                    } else {
                        if height[i] < currentHeight {
                            currentWater += currentHeight - height[i]
                        } else {
                            water += currentWater
                            currentHeight = height[i]
                            currentWater = 0
                        }
                    }
                }
            }
            
            return water
        }
    }
}

extension TrappingRainWater.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [0,1,0,2,1,0,1,3,2,1,2,1], result: 6, func1: self.trap),
            TestCase1(input1: [1,0,2,1,3,3,2,5,2,5,2,3,1,0], result: 7, func1: self.trap),
            TestCase1(input1: [4,2,0,3,2,5], result: 9, func1: self.trap)
        ]
    }
}
