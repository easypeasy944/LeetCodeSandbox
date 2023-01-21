//
//  315. Count of Smaller Numbers After Self.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 21.01.2023.
//

import Foundation

enum CountOfSmallerNumbersAfterSelf {
    
    class Solution {
        func countSmaller(_ nums: [Int]) -> [Int] {
            var array = Array(nums[0..<nums.count]).sorted(by: <)
            var result = Array(repeating: 0, count: nums.count)
            
            for i in 0..<nums.count {
                if array.isEmpty {
                    result[i] = 0
                } else {
                    if
                        let left = findLeft(l: 0, r: array.count - 1, nums: array, value: nums[i]),
                        let right = findRight(l: 0, r: array.count - 1, nums: array, value: nums[i])
                    {
                        result[i] = left
                        array.removeSubrange(left...left)
                    } else {
                        result[i] = findInsert(l: 0, r: array.count - 1, nums: array, value: nums[i])
                    }
                }
            }
            
            return result
        }
        
        func findInsert(l: Int, r: Int, nums: [Int], value: Int) -> Int {
            if l == r && nums[l] != value {
                return l
            }
            
            let mid = l + (r - l) / 2
            
            if nums[mid] < value {
                return findInsert(l: mid + 1, r: r, nums: nums, value: value)
            } else {
                return findInsert(l: l, r: mid, nums: nums, value: value)
            }
        }
        
        func findLeft(l: Int, r: Int, nums: [Int], value: Int) -> Int? {
            if l > r  { return nil }
            
            if l == r && nums[l] != value {
                return nil
            }
            
            let mid = l + (r - l) / 2
            
            if nums[mid] == value {
                if let index = findLeft(l: l, r: mid - 1, nums: nums, value: value) {
                    return index
                } else {
                    return mid
                }
            } else if nums[mid] < value {
                return findLeft(l: mid + 1, r: r, nums: nums, value: value)
            } else {
                return findLeft(l: l, r: mid, nums: nums, value: value)
            }
        }
        
        func findRight(l: Int, r: Int, nums: [Int], value: Int) -> Int? {
            if l > r  { return nil }
            
            if l == r && nums[l] != value {
                return nil
            }
            
            let mid = l + (r - l) / 2
            
            if nums[mid] == value {
                if let index = findRight(l: mid + 1, r: r, nums: nums, value: value) {
                    return index
                } else {
                    return mid
                }
            } else if nums[mid] < value {
                return findRight(l: mid + 1, r: r, nums: nums, value: value)
            } else {
                return findRight(l: l, r: mid, nums: nums, value: value)
            }
        }
    }
}

extension CountOfSmallerNumbersAfterSelf.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(
                input1: [26,78,27,100,33,67,90,23,66,5,38,7,35,23,52,22,83,51,98,69,81,32,78,28,94,13,2,97,3,76,99,51,9,21,84,66,65,36,100,41],
                result: [10,27,10,35,12,22,28,8,19,2,12,2,9,6,12,5,17,9,19,12,14,6,12,5,12,3,0,10,0,7,8,4,0,0,4,3,2,0,1,0],
                func1: self.countSmaller
            ),
            TestCase1(input1: [5,2,6,1], result: [2,1,1,0], func1: self.countSmaller),
            TestCase1(input1: [-1,-1], result: [0,0], func1: self.countSmaller),
            TestCase1(input1: [-1], result: [0], func1: self.countSmaller),
        ]
    }
}
