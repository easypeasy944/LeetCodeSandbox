//
//  28. Implement strStr().swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 25.08.2022.
//

import Foundation

enum ImplementStrStr {
    
    class Solution {
        func strStr(_ haystack: String, _ needle: String) -> Int {
            guard !needle.isEmpty else { return 0 }
            
            for i in 0..<haystack.count {
                if haystack[i] == needle[0] && isEqual(startIndex: i, string1: haystack, string2: needle) {
                    return i
                }
            }
            
            return -1
        }
        
        func isEqual(startIndex: Int, string1: String, string2: String) -> Bool {
            for i in startIndex..<startIndex + string2.count {
                if startIndex..<string1.count ~= i && string1[i] == string2[i - startIndex] {
                    continue
                } else {
                    return false
                }
            }
            
            return true
        }
    }
}

extension ImplementStrStr.Solution: SolutionProtocol {
    var testCases: [Validatable] {
        return [
            TestCase2(input1: "hello", input2: "ll", result: 2, func2: self.strStr),
            TestCase2(input1: "aaaaa", input2: "bba", result: -1, func2: self.strStr),
            TestCase2(input1: "Aynur", input2: "ynu", result: 1, func2: self.strStr),
            TestCase2(input1: "AyAynur", input2: "ynu", result: 3, func2: self.strStr),
            TestCase2(input1: "mississippi", input2: "issip", result: 4, func2: self.strStr),
        ]
    }
}

