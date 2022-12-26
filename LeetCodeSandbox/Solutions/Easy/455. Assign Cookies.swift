//
//  455. Assign Cookies.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 26.12.2022.
//

import Foundation

enum AssignCookies {
    
    class Solution {
        func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
            let sortedG = g.sorted(by: <)
            let sortedS = s.sorted(by: <)
            
            var i: Int = 0
            var j: Int = 0
            
            var count: Int = 0
            
            while i < sortedG.count && j < sortedS.count {
                while j < sortedS.count && sortedG[i] > sortedS[j] {
                    j += 1
                }
                
                if j < sortedS.count {
                    count += 1
                    i += 1
                    j += 1
                }
            }
            
            return count
        }
    }
}

extension AssignCookies.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
//            TestCase2(input1: [1,2,3], input2: [1,1], result: 1, func2: self.findContentChildren),
//            TestCase2(input1: [1,2], input2: [1,2,3], result: 1, func2: self.findContentChildren),
            TestCase2(input1: [2,4,6,8], input2: [1,3,5,7], result: 3, func2: self.findContentChildren),
        ]
    }
}
