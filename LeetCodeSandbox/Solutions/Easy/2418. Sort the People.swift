//
//  2418. Sort the People.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 30.01.2023.
//

import Foundation

enum SortThePeople {
    
    class Solution {
        
        struct Person {
            let name: String
            let height: Int
        }
        
        func sortPeople(_ names: [String], _ heights: [Int]) -> [String] {
            var array: [Person] = []
            
            for (name, height) in zip(names, heights) {
                array.append(Person(name: name, height: height))
            }
            
            return array.sorted { $0.height > $1.height }.map { $0.name }
        }
    }
}

extension SortThePeople.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase2(
                input1: ["Mary","John","Emma"],
                input2: [180,165,170],
                result: ["Mary","Emma","John"],
                func2: self.sortPeople
            )
        ]
    }
}
