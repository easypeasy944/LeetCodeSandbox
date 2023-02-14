//
//  1672. Richest Customer Wealth.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 14.02.2023.
//

import Foundation

enum RichestCustomerWealth {
    
    class Solution {
        func maximumWealth(_ accounts: [[Int]]) -> Int {
            var maxSum: Int = .min
            
            for i in 0..<accounts.count {
                var sum = 0
                for j in 0..<accounts[i].count {
                    sum += accounts[i][j]
                }
                maxSum = max(maxSum, sum)
            }
            
            return maxSum
        }
    }
}

extension RichestCustomerWealth.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [[1,5],[7,3],[3,5]], result: 10, func1: self.maximumWealth)
        ]
    }
}
