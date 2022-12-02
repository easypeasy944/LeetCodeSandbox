//
//  11. Container With Most Water.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 02.12.2022.
//

import Foundation

enum ContainerWithMostWater {
    
    class Solution {
 
        func maxArea(_ height: [Int]) -> Int {
            var water: Int = 0
            
            var i = 0
            var j = height.count - 1
            
            while i < j {
                let minHeight = min(height[i], height[j])
                water = max(water, minHeight * (j - i))
                
                while (height[i] <= minHeight && i < j) {
                    i += 1
                }
                while (height[j] <= minHeight && i < j) {
                    j -= 1
                }
            }
            
            return water
        }
    }
}

extension ContainerWithMostWater.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [1,8,6,2,5,4,8,3,7], result: 49, func1: self.maxArea),
            TestCase1(input1: [100, 100], result: 100, func1: self.maxArea),
            TestCase1(input1: [1,2,1], result: 2, func1: self.maxArea)
        ]
    }
}
