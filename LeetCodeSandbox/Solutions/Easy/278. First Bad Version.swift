//
//  278. First Bad Version.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 26.01.2023.
//

import Foundation

enum FirstBadVersion {
    
    class Solution {
        var bad: Int = 0
        
        func firstBadVersion(_ n: Int) -> Int {
            var l = 1
            var r = n
            var result: Int = -1
            
            while l <= r {
                let mid = l + (r - l) / 2
                
                if isBadVersion(mid) {
                    result = mid
                    r = mid - 1
                } else {
                    l = mid + 1
                }
            }
            
            return result
        }
        
        func isBadVersion(_ version: Int) -> Bool{
            return version >= bad
        }
        
        func run(_ n: Int, bad: Int) -> Int {
            self.bad = bad
            return firstBadVersion(n)
        }
    }
}

extension FirstBadVersion.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase2(input1: 5, input2: 4, result: 4, func2: self.run),
            TestCase2(input1: 5, input2: 5, result: 5, func2: self.run),
            TestCase2(input1: 5, input2: 1, result: 1, func2: self.run),
            TestCase2(input1: 6, input2: 4, result: 4, func2: self.run),
            TestCase2(input1: 6, input2: 5, result: 5, func2: self.run),
            TestCase2(input1: 6, input2: 1, result: 1, func2: self.run),
        ]
    }
}
