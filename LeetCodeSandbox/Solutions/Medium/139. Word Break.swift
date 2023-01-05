//
//  139. Word Break.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 05.01.2023.
//

import Foundation

enum WordBreak {
    
    class Solution {
        struct Range: Hashable {
            let l: Int
            let r: Int
        }
        
        var map: [Range: Bool] = [:]
        
        func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
            map.removeAll(keepingCapacity: true)
            let sArray = Array(s)
            
            let ranges: [Range] = wordDict.flatMap { w in
                return findRanges(sArray, Array(w))
            }
            
            let result = findFullRange(ranges: ranges, l: 0, r: s.count - 1)
            return result
        }
        
        private func findFullRange(ranges: [Range], l: Int, r: Int) -> Bool {
            if l > r { return true }
            
            if let value = map[Range(l: l, r: r)] {
                return value
            }
            
            for range in ranges {
                if range.l == l && l + (range.r - range.l) <= r {
                    map[Range(l: 0, r: range.r)] = true
                    
                    if findFullRange(ranges: ranges, l: range.r + 1, r: r) {
                        map[Range(l: l, r: r)] = true
                        return true
                    }
                }
            }
            
            map[Range(l: l, r: r)] = false
            return false
        }
        
        private func findRanges(_ s: [Character], _ w: [Character]) -> [Range] {
            var ranges: [Range] = []
            
            for (index, _) in s.enumerated() {
                var l = index
                var allSatisfy: Bool = true
                
                for i in 0..<w.count where l < s.count {
                    if w[i] == s[l] {
                        l += 1
                    } else {
                        allSatisfy = false
                        break
                    }
                }
                
                if allSatisfy && index + w.count == l {
                    ranges.append(Range(l: index, r: index + w.count - 1))
                }
            }
            
            return ranges
        }
    }
}

extension WordBreak.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase2(input1: "leetcode", input2: ["leet","code"], result: true, func2: self.wordBreak),
            TestCase2(input1: "applepenapple", input2: ["apple","pen"], result: true, func2: self.wordBreak),
            TestCase2(input1: "aaaaaaaaaaaaaaaaaa", input2: ["a","aa"], result: true, func2: self.wordBreak),
            TestCase2(input1: "ababababa", input2: ["a","ba", "ab"], result: true, func2: self.wordBreak),
            TestCase2(input1: "abababab", input2: ["ba", "aba"], result: false, func2: self.wordBreak),
            TestCase2(input1: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab", input2: ["a","aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa"], result: false, func2: self.wordBreak),
        ]
    }
}
