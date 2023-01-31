//
//  1037. Valid Boomerang.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 31.01.2023.
//

import Foundation

enum ValidBoomerang {
    
    class Solution {
        func isBoomerang(_ points: [[Int]]) -> Bool {
           return (points[1][1] - points[0][1]) * (points[2][0] - points[0][0]) !=
            (points[2][1] - points[0][1]) * (points[1][0] - points[0][0])
        }
    }
}

extension ValidBoomerang.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [[73,31],[73,19],[73,45]], result: false, func1: self.isBoomerang),
            TestCase1(input1: [[92,72],[12,40],[27,46]], result: false, func1: self.isBoomerang),
            TestCase1(input1: [[0,1],[2,1],[2,2]], result: true, func1: self.isBoomerang),
            TestCase1(input1: [[1,1],[2,3],[3,2]], result: true, func1: self.isBoomerang),
            TestCase1(input1: [[1,1],[2,2],[3,3]], result: false, func1: self.isBoomerang),
            TestCase1(input1: [[1,1],[1,1],[3,3]], result: false, func1: self.isBoomerang),
        ]
    }
}
