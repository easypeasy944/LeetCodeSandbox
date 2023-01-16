//
//  739. Daily Temperatures.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 16.01.2023.
//

import Foundation

enum DailyTemperatures {
    
    class Solution {
        func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
            var stack = Stack<(index: Int, value: Int)>()
            var result = Array(repeating: 0, count: temperatures.count)
            
            for i in (0..<temperatures.count).reversed() {
                while let topValue = stack.top(), topValue.value <= temperatures[i] {
                    _  = stack.pop()
                }
                
                if let topValue = stack.top() {
                    result[i] = topValue.index - i
                }
                stack.push((i, temperatures[i]))
            }
            
            return result
        }
    }
}

extension DailyTemperatures.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [73,74,75,71,69,72,76,73], result: [1,1,4,2,1,1,0,0], func1: self.dailyTemperatures),
            TestCase1(input1: [30,40,50,60], result: [1,1,1,0], func1: self.dailyTemperatures),
            TestCase1(input1: [30,60,90], result: [1,1,0], func1: self.dailyTemperatures),
            TestCase1(input1: [89,62,70,58,47,47,46,76,100,70], result: [8,1,5,4,3,2,1,1,0,0], func1: self.dailyTemperatures),
        ]
    }
}
