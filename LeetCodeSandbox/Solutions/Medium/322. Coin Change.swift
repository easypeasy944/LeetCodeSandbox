//
//  322. Coin Change.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 18.03.2023.
//

import Foundation

enum CoinChange {
    class Solution {
        func coinChange(_ coins: [Int], _ amount: Int) -> Int {
            var dp: [Int] = Array(repeating: Int.max, count: amount + 1)
            dp[0] = 0
            
            for i in 1..<dp.count {
                for coin in coins where i >= coin {
                    if dp[i - coin] != Int.max {
                        dp[i] = min(dp[i], 1 + dp[i - coin])
                    }
                }
            }
            
            return dp[amount] == Int.max ? -1 : dp[amount]
        }
    }
}

extension CoinChange.Solution: SolutionProtocol {
    var testCases: [Validatable] {
        return [
            TestCase2(input1: [3,7,405,436], input2: 8839, result: 25, func2: self.coinChange),
            TestCase2(input1: [186,419,83,408], input2: 6249, result: 20, func2: self.coinChange),
            TestCase2(input1: [1,2,5], input2: 100, result: 20, func2: self.coinChange),
            TestCase2(input1: [1,2,5], input2: 11, result: 3, func2: self.coinChange),
            TestCase2(input1: [2], input2: 3, result: -1, func2: self.coinChange),
        ]
    }
}
