//
//  121. Best Time to Buy and Sell Stock.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 10.01.2023.
//

import Foundation

enum BestTimeToBuyAndSellStock {
    
    class Solution {
        func maxProfit(_ prices: [Int]) -> Int {
            var maxProfix: Int = 0
            var minNum: Int = prices[0]
            
            for i in 1..<prices.count {
                if prices[i] < minNum {
                    minNum = prices[i]
                } else {
                    maxProfix = max(maxProfix, prices[i] - minNum)
                }
            }
            
            return maxProfix
        }
    }
}

extension BestTimeToBuyAndSellStock.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [7,1,5,3,6,4], result: 5, func1: self.maxProfit),
            TestCase1(input1: [7,6,4,3,1], result: 0, func1: self.maxProfit)
        ]
    }
}
