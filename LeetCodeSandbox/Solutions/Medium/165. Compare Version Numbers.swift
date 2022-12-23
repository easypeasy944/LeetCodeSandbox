//
//  165. Compare Version Numbers.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 23.12.2022.
//

import Foundation

enum CompareVersionNumbers {
    
    class Solution {
        func compareVersion(_ version1: String, _ version2: String) -> Int {
            let components1 = version1.components(separatedBy: ".").map { Int($0)! }
            let components2 = version2.components(separatedBy: ".").map { Int($0)! }
            
            for i in 0..<max(components1.count, components2.count) {
                let v1 = i < components1.count ? components1[i] : 0
                let v2 = i < components2.count ? components2[i] : 0
                
                if v1 < v2 {
                    return -1
                } else if v1 > v2 {
                    return 1
                }
            }
            
            return 0
        }
    }
}

extension CompareVersionNumbers.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase2(input1: "1", input2: "1.0.0", result: 0, func2: self.compareVersion),
            TestCase2(input1: "1.1", input2: "1.1.2", result: 1, func2: self.compareVersion),
            TestCase2(input1: "1.2.3", input2: "1.2.4", result: 1, func2: self.compareVersion),
            TestCase2(input1: "1.002.3", input2: "1.00002.4", result: 1, func2: self.compareVersion),
        ]
    }
}
