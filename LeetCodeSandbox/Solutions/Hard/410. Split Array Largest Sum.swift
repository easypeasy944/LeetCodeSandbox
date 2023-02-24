//
//  410. Split Array Largest Sum.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 24.02.2023.
//

import Foundation

enum SplitArrayLargestSum {
    
    class Solution {
        struct Input: Hashable {
            let l: Int
            let r: Int
            let k: Int
        }
        
        func splitArray(_ nums: [Int], _ k: Int) -> Int {
            var sums: [Int] = Array(repeating: 0, count: nums.count)
            var currentSum: Int = 0
            for i in 0..<nums.count {
                currentSum += nums[i]
                sums[i] = currentSum
            }
            
            func getSum(_ l: Int, _ r: Int) -> Int {
                return sums[r] - sums[l] + nums[l]
            }
            
            var cache: [Input: Int] = [:]
            
            func maxSum(_ l: Int, _ r: Int, _ k: Int) -> Int {
                if k == 1 {
                    return getSum(l, r)
                } else if k == 2 && r - l == 1 {
                    return max(nums[l], nums[r])
                }
                
                if let value = cache[Input(l: l, r: r, k: k)] {
                    return value
                }
                
                var sum = Int.max
                
                for i in l..<r {
                    let leftMaxSum = getSum(l, i)
                    let rightMaxSum = maxSum(i + 1, r, k - 1)
                    sum = min(sum, max(leftMaxSum, rightMaxSum))
                    
                    if leftMaxSum >= rightMaxSum {
                        break
                    }
                }
                
                cache[Input(l: l, r: r, k: k)] = sum
                return sum
            }
            
            let result = maxSum(0, nums.count - 1, k)
            return result
        }
    }
}

extension SplitArrayLargestSum.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase2(input1: [1, 4, 4], input2: 3, result: 4, func2: self.splitArray),
            TestCase2(input1: [5,2,1,4,6], input2: 3, result: 7, func2: self.splitArray),
            TestCase2(input1: [7,2,5,10,8], input2: 3, result: 14, func2: self.splitArray),
            TestCase2(input1: [7,2,5,10,8], input2: 2, result: 18, func2: self.splitArray)
        ]
    }
}
