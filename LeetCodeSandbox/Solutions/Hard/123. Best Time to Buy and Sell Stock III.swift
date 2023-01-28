//
//  123. Best Time to Buy and Sell Stock III.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 28.01.2023.
//

import Foundation

enum BestTimeToBuyAndSellStockIII {
    
    class Solution {
        func maxProfit(_ prices: [Int]) -> Int {
            var firstBuy = Int.max
            var secondBuy = Int.max
            var firstProfit = Int.min
            var secondProfit = Int.min
            
            for x in prices {
                firstBuy = min(firstBuy, x)
                firstProfit = max(firstProfit, x - firstBuy)
                secondBuy = min(secondBuy, x - firstProfit)
                secondProfit = max(secondProfit, x - secondBuy)
            }
            return secondProfit
        }
    }
}

extension BestTimeToBuyAndSellStockIII.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [1,2,4,2,5,7,2,4,9,0], result: 13, func1: self.maxProfit),
            TestCase1(input1: [3,3,5,0,0,3,1,4], result: 6, func1: self.maxProfit),
            TestCase1(input1: [1,2,3,4,5], result: 4, func1: self.maxProfit),
            TestCase1(input1: [7,6,4,3,1], result: 0, func1: self.maxProfit),
        ]
    }
}
