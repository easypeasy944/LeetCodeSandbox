//
//  49. Group Anagrams.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 26.08.2022.
//

import Foundation

enum GroupAnagrams {
    
    class Solution {
        func groupAnagrams(_ strs: [String]) -> [[String]] {
            var map: [String: [String]] = [:]
            
            for str in strs {
                let key = String(str.sorted())
                map[key, default: []].append(str)
            }

            
            return map.sorted {
                return $0.key < $1.key
            }.map { $0.value }
        }
    }
}

extension GroupAnagrams.Solution: SolutionProtocol {
    var testCases: [Validatable] {
        
        
        return [
            TestCase1(input1: ["eat","tea","tan","ate","nat","bat"], result: [["bat"], ["eat", "tea", "ate"], ["tan", "nat"]], func1: self.groupAnagrams),
            TestCase1(input1: [""], result: [[""]], func1: self.groupAnagrams),
            TestCase1(input1: ["a"], result: [["a"]], func1: self.groupAnagrams),
        ]
    }
}
