//
//  2028. Find Missing Observations.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 05.02.2023.
//

import Foundation

enum FindMissingObservations {
    
    class Solution {
        func missingRolls(_ rolls: [Int], _ mean: Int, _ n: Int) -> [Int] {
            let rollsSum = rolls.reduce(0, +)
            
            var sum = mean * (n + rolls.count) - rollsSum
            var avg: Double = Double(sum) / Double(n)
            var result: [Int] = []
            
            if !(1...6 ~= avg) {
                return []
            }
            
            for i in 0..<n {
                let ceiled = Int(ceil(avg))
                
                if ceil(avg) == floor(avg) {
                    let subArray = Array(repeating: ceiled, count: n - i)
                    result.append(contentsOf: subArray)
                    break
                }
                
                sum -= ceiled
                result.append(ceiled)
                
                if sum < 0 {
                    return []
                }
                
                if i != n - 1 {
                    avg = Double(sum) / Double(n - i - 1)
                }
            }
            
            return result
        }
    }
}

extension FindMissingObservations.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        let comparator: ([Int], [Int]) -> Bool = {
            return $0.sorted(by: <) == $1.sorted(by: <)
        }
        
        return [
            TestCase3(
                input1: [3,2,4,3],
                input2: 4,
                input3: 2,
                result: [6,6],
                func3: self.missingRolls,
                comparator: comparator
            ),
            TestCase3(
                input1: [1,5,6],
                input2: 3,
                input3: 4,
                result: [2,3,2,2],
                func3: self.missingRolls,
                comparator: comparator
            ),
            TestCase3(
                input1: [1,2,3,4],
                input2: 6,
                input3: 4,
                result: [],
                func3: self.missingRolls,
                comparator: comparator
            )
        ]
    }
}
