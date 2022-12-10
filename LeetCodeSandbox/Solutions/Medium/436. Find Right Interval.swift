//
//  436. Find Right Interval.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 07.12.2022.
//

import Foundation

enum FindRightInterval {
    
    class Solution {
        struct Item {
            let index: Int
            let start: Int
            let end: Int
        }
        
        func findRightInterval(_ intervals: [[Int]]) -> [Int] {
            var map: [Int: Int] = [:]
            var set = Set<Int>()
            
            let sortedIntervals = intervals.enumerated().map { Item(index: $0, start: $1[0], end: $1[1]) }.sorted(by: { $0.start < $1.start })
            
            for interval in sortedIntervals {
                if interval.start == interval.end {
                    map[interval.end] = interval.index
                    continue
                }
                for value in set where value <= interval.start {
                    map[value, default: -1] = interval.index
                    set.remove(value)
                }
                
                set.insert(interval.end)
            }
            
            var result: [Int] = []
            for index in 0..<intervals.count {
                result.append(map[intervals[index][1], default: -1])
            }
            
            return result
        }
    }
}

extension FindRightInterval.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [[1,1],[3,4]], result: [0,-1], func1: self.findRightInterval),
            TestCase1(input1: [[3,4],[2,3],[1,2]], result: [-1,0,1], func1: self.findRightInterval),
            TestCase1(input1: [[1,4],[2,3],[3,4]], result: [-1,2,-1], func1: self.findRightInterval),
            TestCase1(input1: [[1,2]], result: [-1], func1: self.findRightInterval),
        ]
    }
}
