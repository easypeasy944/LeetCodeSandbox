//
//  41. First Missing Positive.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 26.08.2022.
//

import Foundation

enum FirstMissingPositive {
    
    class Solution {
        func firstMissingPositive(_ nums: [Int]) -> Int {
            var ranges: [ClosedRange<Int>] = []
            
            for num in nums {
                guard num >= 0 else { continue }
                
                let newRange = num...num
                
                if ranges.isEmpty {
                    ranges = [newRange]
                } else {
                    var newRanges = ranges
                    var hasMerged: Bool = false
                    
                    if ranges.count > 1 {
                        for i in 0..<ranges.count - 1 {
                            if canMerge(range1: ranges[i], range2: newRange) && canMerge(range1: newRange, range2: ranges[i + 1]) {
                                newRanges[i] = merge(range1: ranges[i], range2: ranges[i + 1])
                                newRanges.remove(at: i + 1)
                                hasMerged = true
                                break
                            }
                        }
                    }
                    
                    if !hasMerged {
                        for i in 0..<ranges.count {
                            if i == 0 {
                                if newRange.upperBound <= ranges[i].lowerBound && canMerge(range1: newRange, range2: ranges[i]) {
                                    newRanges[i] = merge(range1: newRange, range2: ranges[i])
                                    break
                                } else if newRange.upperBound <= ranges[i].lowerBound {
                                    newRanges.insert(newRange, at: i)
                                    break
                                }
                            }
                            if i == ranges.count - 1 {
                                if newRange.lowerBound >= ranges[i].upperBound && canMerge(range1: ranges[i], range2: newRange) {
                                    newRanges[i] = merge(range1: ranges[i], range2: newRange)
                                    break
                                } else if newRange.lowerBound >= ranges[i].upperBound {
                                    newRanges.append(newRange)
                                    break
                                }
                            }
                            
                            if i != ranges.count - 1 {
                                if canMerge(range1: newRange, range2: ranges[i + 1]) {
                                    newRanges[i + 1] = merge(range1: ranges[i + 1], range2: newRange)
                                    break
                                }
                                if canMerge(range1: newRange, range2: ranges[i]) {
                                    newRanges[i] = merge(range1: ranges[i], range2: newRange)
                                    break
                                }
                                
                                if newRange.lowerBound > ranges[i].upperBound && newRange.upperBound < ranges[i + 1].lowerBound {
                                    newRanges.insert(newRange, at: i + 1)
                                    break
                                }
                            }
                        }
                    }
                    
                    ranges = newRanges
                }
            }
            
            if ranges.isEmpty {
                return 1
            } else if ranges[0].lowerBound <= 1 {
                return ranges[0].upperBound + 1
            } else {
                return 1
            }
        }
        
        func canMerge(range1: ClosedRange<Int>, range2: ClosedRange<Int>) -> Bool {
            if range1.lowerBound > range2.lowerBound {
                return canMerge(range1: range2, range2: range1)
            } else {
                return range2.lowerBound - range1.upperBound <= 1
            }
        }
        
        func merge(range1: ClosedRange<Int>, range2: ClosedRange<Int>) -> ClosedRange<Int> {
            return min(range1.lowerBound, range2.lowerBound)...(max(range1.upperBound, range2.upperBound))
        }
    }
}

extension FirstMissingPositive.Solution: SolutionProtocol {
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [-5], result: 1, func1: self.firstMissingPositive),
            TestCase1(input1: [1,2,0], result: 3, func1: self.firstMissingPositive),
            TestCase1(input1: [3,4,-1,1], result: 2, func1: self.firstMissingPositive),
            TestCase1(input1: [7,8,9,11,12], result: 1, func1: self.firstMissingPositive),
            TestCase1(input1: [0,1,2,4,5,7,8,12,13,14,16], result: 3, func1: self.firstMissingPositive),
            TestCase1(input1: [2,4,5,7,8,12,13,14,16], result: 1, func1: self.firstMissingPositive),
            TestCase1(input1: [1,2,6,3,5,4], result: 7, func1: self.firstMissingPositive),
            TestCase1(input1: [1,2,3,4,5,6,7,8,9,10,11,12,23,20], result: 13, func1: self.firstMissingPositive),
            TestCase1(input1: [99,94,96,11,92,5,91,89,57,85,66,63,84,81,79,61,74,78,77,30,64,13,58,18,70,69,51,12,32,34,9,43,39,8,1,38,49,27,21,45,47,44,53,52,48,19,50,59,3,40,31,82,23,56,37,41,16,28,22,33,65,42,54,20,29,25,10,26,4,60,67,83,62,71,24,35,72,55,75,0,2,46,15,80,6,36,14,73,76,86,88,7,17,87,68,90,95,93,97,98], result: 100, func1: self.firstMissingPositive),
            
        ]
    }
}
