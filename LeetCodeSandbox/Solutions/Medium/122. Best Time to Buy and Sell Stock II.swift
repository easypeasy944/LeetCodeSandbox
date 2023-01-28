//
//  122. Best Time to Buy and Sell Stock II.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 28.01.2023.
//

import Foundation

enum BestTimeToBuyAndSellStockII {
    
    class Solution {
        func maxProfit(_ prices: [Int]) -> Int {
            var sum: Int = 0
            var i: Int = 0
            
            while i < prices.count {
                var day = i
                
                while day + 1 < prices.count && prices[day + 1] > prices[day] {
                    day += 1
                }
                
                if day != i {
                    sum += prices[day] - prices[i]
                }
                
                i = day + 1
            }
            
            return sum
        }
    }
}

extension BestTimeToBuyAndSellStockII.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [7,1,5,3,6,4], result: 7, func1: self.maxProfit),
            TestCase1(input1: [1,2,3,4,5], result: 4, func1: self.maxProfit),
            TestCase1(input1: [7,6,4,3,1], result: 0, func1: self.maxProfit),
        ]
    }
}
