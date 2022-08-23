//
//  15. 3Sum.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 23.08.2022.
//

import Foundation

enum ThreeSum {
    
    class Solution {
        func threeSum(_ nums: [Int]) -> [[Int]] {
            var result = [[Int]]()
            var map: [Int: [Int]] = [:]
            let numbers = nums.sorted()
            for i in 0..<numbers.count {
                map[numbers[i], default: []].append(i)
            }
            
            for i in 0..<numbers.count - 1 {
                for j in i + 1..<numbers.count {
                    if let indexes = map[-(numbers[i] + numbers[j])], indexes.last! > j {
                        result.append([numbers[i], numbers[j], -(numbers[i] + numbers[j])])
                    }
                }
            }
            
            return Array(Set(result))
        }
    }
}

extension ThreeSum.Solution: SolutionProtocol {
    var testCases: [Validatable] {
        let comparator: ([[Int]]) -> Set<[Int]> = { result in
            var set = Set<[Int]>()
            result.forEach { set.insert($0.sorted()) }
            return set
        }
        
        return [
            TestCase1(input1: [-1,0,1,2,-1,-4], result: [[-1,0,1], [-1,-1,2]], func1: self.threeSum, comparator: comparator),
            TestCase1(input1: [0, 1, 1], result: [], func1: self.threeSum, comparator: comparator),
            TestCase1(input1: [0, 0, 0], result: [[0, 0, 0]], func1: self.threeSum, comparator: comparator)
        ]
    }
}
