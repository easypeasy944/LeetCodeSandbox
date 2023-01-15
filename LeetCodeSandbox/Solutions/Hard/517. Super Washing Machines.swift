//
//  517. Super Washing Machines.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 15.01.2023.
//

import Foundation

enum SuperWashingMachines {
    
    class Solution {
        func findMinMoves(_ machines: [Int]) -> Int {
            guard machines.count > 1 else { return 0 }
            
            var leftBalances: [Int] = Array(repeating: 0, count: machines.count)
            var rightBalances: [Int] = Array(repeating: 0, count: machines.count)
            let sum = machines.reduce(0, +)
            
            if sum % machines.count != 0 {
                return -1
            }
            
            let avg = sum / machines.count
            
            for i in 1..<machines.count {
                leftBalances[i] = leftBalances[i - 1] + machines[i - 1]
            }
            
            for i in (0...(machines.count - 2)).reversed() {
                rightBalances[i] = rightBalances[i + 1] + machines[i + 1]
            }
            
            var count: Int = 0
            for i in 0..<machines.count {
                let leftDiff = i * avg - leftBalances[i]
                let rightDiff = (machines.count - 1 - i) * avg - rightBalances[i]
                
                count = max(count, max(leftDiff, 0) + max(rightDiff, 0))
            }
            
            return count
        }
    }
}

extension SuperWashingMachines.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [0,0,11,5], result: 8, func1: self.findMinMoves),
            TestCase1(input1: [0,0,100,100], result: 100, func1: self.findMinMoves),
            TestCase1(input1: [1,0,5], result: 3, func1: self.findMinMoves),
            TestCase1(input1: [0,3,0], result: 2, func1: self.findMinMoves),
            TestCase1(input1: [1,0,5,3,7,6,2,8], result: 7, func1: self.findMinMoves),
        ]
    }
}
