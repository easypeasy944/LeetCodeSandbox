//
//  698. Partition to K Equal Sum Subsets.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 19.02.2023.
//

import Foundation

/* non-independent solution */
enum PartitionToKEqualSumSubsets {
    
    class Solution {
        func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool {
            let sum = nums.reduce(0, +)
            
            if sum % k != 0 {
                return false
            }
            
            let reqSum = sum / k
            var subSets = Array(repeating: 0, count: k)
            let sortedNums = nums.sorted(by: >)
            
            func recurse(_ i: Int) -> Bool {
                if i == sortedNums.count {
                    return true
                }
                
                for j in 0..<k {
                    if subSets[j] + sortedNums[i] <= reqSum {
                        subSets[j] += sortedNums[i]
                        
                        if recurse(i + 1) {
                            return true
                        }
                        
                        subSets[j] -= sortedNums[i]
                        
                        if subSets[j] == 0 {
                            break
                        }
                    }
                }
                
                return false
            }
            
            let result = recurse(0)
            return result
        }
    }
}

extension PartitionToKEqualSumSubsets.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase2(input1: [4,3,2,3,5,2,1], input2: 4, result: true, func2: self.canPartitionKSubsets),
            TestCase2(input1: [5,5,5,5,4,4,4,4,3,3,3,3], input2: 3, result: true, func2: self.canPartitionKSubsets),
            TestCase2(input1: [4,13,1,1,14,15,1,3,13,1,3,5,2,8,12], input2: 4, result: false, func2: self.canPartitionKSubsets),
        ]
    }
}
