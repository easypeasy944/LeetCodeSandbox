//
//  611. Valid Triangle Number.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 25.03.2023.
//

import Foundation

enum ValidTriangleNumber {
    class Solution {
        func triangleNumber(_ nums: [Int]) -> Int {
            var count: Int = 0
            var map: [Int: Int] = [:]
            nums.forEach { map[$0, default: 0] += 1 }
            let sortedNums = nums.sorted(by: <)
            
            for i in 0..<sortedNums.count {
                for j in (i + 1)..<sortedNums.count {
                    for k in (j + 1)..<sortedNums.count {
                        if sortedNums[i] + sortedNums[j] > sortedNums[k] {
                            count += 1
                        }
                    }
                }
            }
            
            return count
        }
    }
}

extension ValidTriangleNumber.Solution: SolutionProtocol {
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [2,2,3,4], result: 3, func1: self.triangleNumber),
            TestCase1(input1: [4,2,3,4], result: 4, func1: self.triangleNumber),
        ]
    }
}
