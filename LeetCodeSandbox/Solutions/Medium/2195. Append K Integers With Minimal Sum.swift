//
//  2195. Append K Integers With Minimal Sum.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 15.01.2023.
//

import Foundation

enum AppendKIntegersWithMinimalSum {
    
    class Solution {
        func minimalKSum(_ nums: [Int], _ k: Int) -> Int {
            let sortedNums = nums.sorted(by: <)
            var count: Int = 0
            var sum: Double = 0
            
            for i in 0..<sortedNums.count where count < k {
                let prev = i == 0 ? 0 : sortedNums[i - 1]
                
                let maxCount = max(0, min(sortedNums[i] - prev - 1, k - count))
                count += maxCount
                sum += Double(maxCount) * Double(prev + 1 + prev + maxCount) / 2
            }
            
            if count < k {
                let leftCount = k - count
                let prev = sortedNums[sortedNums.count - 1]
                sum += Double(leftCount) * Double(prev + 1 + prev + leftCount) / 2
            }
            
            return Int(sum.rounded())
        }
    }
}

extension AppendKIntegersWithMinimalSum.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase2(input1: [96,44,99,25,61,84,88,18,19,33,60,86,52,19,32,47,35,50,94,17,29,98,22,21,72,100,40,84], input2: 35, result: 794, func2: self.minimalKSum),
            TestCase2(input1: [5,6], input2: 6, result: 25, func2: self.minimalKSum),
            TestCase2(input1: [1,4,25,10,25], input2: 2, result: 5, func2: self.minimalKSum),
        ]
    }
}
