//
//  347. Top K Frequent Elements.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 05.12.2022.
//

import Foundation

enum TopKFrequentElements {
    
    class Solution {
        struct Pair: Comparable {
            static func < (lhs: TopKFrequentElements.Solution.Pair, rhs: TopKFrequentElements.Solution.Pair) -> Bool {
                lhs.frequency < rhs.frequency
            }
            
            let frequency: Int
            let number: Int
        }
        
        func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
            let map: [Int: Int] = nums.reduce(into: [:], { $0[$1, default: 0] += 1 })
            
            var heap = Heap<Pair>(kind: .max)
            for (number, frequency) in map {
                heap.insert(Pair(frequency: frequency, number: number))
            }
            
            var result: [Int] = []
            result.reserveCapacity(k)
            for _ in 0..<k {
                if let top = heap.delete(index: 0) {
                    result.append(top.number)
                }
            }
            
            return result
        }
    }
}

extension TopKFrequentElements.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        let comparator: ([Int], [Int]) -> Bool = { lhs, rhs in
            return lhs.sorted() == rhs.sorted()
        }
        
        return [
            TestCase2(input1: [1,1,1,2,2,3], input2: 2, result: [1,2], func2: self.topKFrequent, comparator: comparator),
            TestCase2(input1: [1], input2: 1, result: [1], func2: self.topKFrequent, comparator: comparator),
            TestCase2(input1: [5,-3,9,1,7,7,9,10,2,2,10,10,3,-1,3,7,-9,-1,3,3], input2: 3, result: [3,7,10], func2: self.topKFrequent, comparator: comparator),
        ]
    }
}
