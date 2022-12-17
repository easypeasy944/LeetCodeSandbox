//
//  480. Sliding Window Median.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 17.12.2022.
//

import Foundation

enum SlidingWindowMedian {
    
    class Solution {
        func medianSlidingWindow(_ nums: [Int], _ k: Int) -> [Double] {
            var window: [Int] = []
            var result: [Double] = []
            
            for i in 0...(nums.count - k) {
                if i == 0 {
                    (0..<k).forEach { add(&window, nums[$0]) }
                } else {
                    remove(&window, nums[i - 1])
                    add(&window, nums[i + k - 1])
                }
                
                let midLeftIndex = Int(floor(Double(k + 1) / 2)) - 1
                let midRightIndex = Int(ceil(Double(k + 1) / 2)) - 1
                
                result.append(Double(window[midLeftIndex] + window[midRightIndex])/2)
            }
            
            return result
        }
        
        func add(_ nums: inout [Int], _ num: Int) {
            guard !nums.isEmpty else {
                nums.append(num)
                return
            }
            
            var l: Int = 0
            var r: Int = nums.count - 1
            
            while l <= r {
                let mid = l + (r - l) / 2
                
                if nums[mid] == num {
                    nums.insert(num, at: mid)
                    return
                } else if num < nums[mid] {
                    r = mid - 1
                } else {
                    l = mid + 1
                }
            }
            
            nums.insert(num, at: l)
        }
        
        func remove(_ nums: inout [Int], _ num: Int) {
            guard !nums.isEmpty else {
                return
            }
            
            var l: Int = 0
            var r: Int = nums.count - 1
            
            while l <= r {
                let mid = l + (r - l) / 2
                
                if nums[mid] == num {
                    nums.remove(at: mid)
                    return
                } else if num < nums[mid] {
                    r = mid - 1
                } else {
                    l = mid + 1
                }
            }
            
            nums.insert(num, at: l)
        }
    }
}

extension SlidingWindowMedian.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase2(input1: [1,3,-1,-3,5,3,6,7], input2: 3, result: [1,-1,-1,3,5,6], func2: self.medianSlidingWindow),
            TestCase2(input1: [1,2,3,4,2,3,1,4,2], input2: 3, result: [2,3,3,3,2,3,2], func2: self.medianSlidingWindow),
            TestCase2(input1: [1,2,3,4,2,3,1,4,2], input2: 1, result: [1,2,3,4,2,3,1,4,2], func2: self.medianSlidingWindow),
            TestCase2(input1: [1,2,3,4,2], input2: 2, result: [1.5,2.5,3.5,3], func2: self.medianSlidingWindow),
            TestCase2(input1: [1,2,3,4,2], input2: 2, result: [1.5,2.5,3.5,3], func2: self.medianSlidingWindow)
        ]
    }
}
