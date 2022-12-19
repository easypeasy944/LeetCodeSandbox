//
//  560. Subarray Sum Equals K.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 18.12.2022.
//

import Foundation

enum SubarraySumEqualsK {
    
    class Solution {
        struct Range: Hashable {
            let start: Int
            let end: Int
        }
        
        func subarraySum(_ nums: [Int], _ k: Int) -> Int {
            var size = 2
            var cache: [Range: Int] = [:]
            var count: Int = 0
            
            (0..<nums.count).forEach {
                cache[Range(start: $0, end: $0)] = nums[$0]
                if nums[$0] == k {
                    count += 1
                }
            }
            
            while size <= nums.count {
                var newCache: [Range: Int] = [:]
                
                for i in 0...(nums.count - size) {
                    let cachedValue = cache[Range(start: i, end: i + size - 2)]!
                    let result = cachedValue + nums[i + size - 1]
                    
                    if result == k {
                        count += 1
                    }
                    
                    newCache[Range(start: i, end: i + size - 1)] = result
                }
                
                cache = newCache
                size += 1
            }
            
            return count
        }
    }
}

extension SubarraySumEqualsK.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase2(input1: [1,2,3], input2: 3, result: 2, func2: self.subarraySum),
            TestCase2(input1: [1,1,2,0,4,3,5], input2: 8, result: 2, func2: self.subarraySum),
        ]
    }
}
