//
//  474. Ones and Zeroes.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 19.02.2023.
//

import Foundation

enum OnesAndZeroes {
    
    class Solution {
        func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
            var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
            
            for s in strs {
                let (zeros, ones) = calc(s)
                
                guard zeros <= m else { continue }
                
                for i in (zeros...m).reversed() {
                    
                    guard ones <= n else { continue }
                    
                    for j in (ones...n).reversed() {
                        dp[i][j] = max(dp[i][j], 1 + dp[i - zeros][j - ones])
                        printDP(dp)
                    }
                }
            }
            
            return dp[m][n]
        }
        
        func printDP(_ dp: [[Int]]) {
            for i in 0..<dp.count {
                for j in 0..<dp[i].count {
                    print("\(dp[i][j])".leftPadding(toLength: 3, withPad: " "), terminator: "")
                }
                print()
            }
            print()
        }
        
        func calc(_ str: String) -> (Int, Int) {
            var zeros: Int = 0
            str.forEach {
                if $0 == "0" {
                    zeros += 1
                }
            }
            return (zeros, str.count - zeros)
        }
    }
}

extension OnesAndZeroes.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase3(input1: ["10","0001","111001","1","0"], input2: 5, input3: 3, result: 4, func3: self.findMaxForm),
            TestCase3(
                input1: ["0","11","1000","01","0","101","1","1","1","0","0","0","0","1","0","0110101","0","11","01","00","01111","0011","1","1000","0","11101","1","0","10","0111"],
                //      ["0","0","1","1","1","0","0","0","0", "1", "0", "0", "1", "0", "1", "0", "11", "01", "11", "01", "00", "10", "101", "1000", "0011", "1000", "0111", "01111", "11101", "0110101"]
                input2: 9,
                input3: 80,
                result: 17,
                func3: self.findMaxForm)
        ]
    }
}

extension String {
  func leftPadding(toLength: Int, withPad character: Character) -> String {
    if count < toLength {
      return String(repeating: character, count: toLength - count) + self
    } else {
      return self
    }
  }
}
