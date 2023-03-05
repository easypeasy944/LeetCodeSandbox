//
//  718. Maximum Length of Repeated Subarray.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 05.03.2023.
//

import Foundation

enum MaximumLengthOfRepeatedSubarray {
    class Solution {
        func findLength(_ nums1: [Int], _ nums2: [Int]) -> Int {
            if (nums1.count < nums2.count) {
                return findLength(nums2, nums1)
            }
            
            let M = nums1.count
            let N = nums2.count
            
            var dp = Array(repeating: 0, count: N + 1)
            var ans = 0
            
            for i in 0..<M {
                for j in (0..<N).reversed() {
                    if nums1[i] == nums2[j] {
                        dp[j + 1] = dp[j] + 1
                    } else {
                        dp[j + 1] = 0
                    }
                    
                    ans = max(ans, dp[j + 1])
                }
            }
            
            return ans
        }
    }
}

extension MaximumLengthOfRepeatedSubarray.Solution: SolutionProtocol {
    
    var testCases: [Validatable] {
        return [
            TestCase2(input1: [1,2,3,2,1,8], input2: [3,2,1,4,7], result: 3, func2: self.findLength),
            TestCase2(input1: [0,0,0,0,0], input2: [0,0,0,0,0], result: 5, func2: self.findLength),
        ]
    }
}
