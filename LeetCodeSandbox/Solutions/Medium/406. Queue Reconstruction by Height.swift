//
//  406. Queue Reconstruction by Height.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 11.02.2023.
//

import Foundation

enum QueueReconstructionByHeight {
    
    class Solution {
        func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
            let sortedPeople = people.sorted {
                if $0[0] != $1[0] {
                    return $0[0] > $1[0]
                } else {
                    return $0[1] < $1[1]
                }
            }
            
            var result: [[Int]] = []
            
            for people in sortedPeople {
                result.insert(people, at: people[1])
            }
            
            return result
        }
    }
}

extension QueueReconstructionByHeight.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(
                input1: [[7,0],[4,4],[7,1],[5,0],[6,1],[5,2]],
                result: [[5,0],[7,0],[5,2],[6,1],[4,4],[7,1]],
                func1: self.reconstructQueue
            )
        ]
    }
}
