//
//  215. Kth Largest Element in an Array.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 23.01.2023.
//

import Foundation

enum KthLargestElementInAnArray {
    
    class Solution {
        func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
            var array = nums
            return sort(l: 0, r: nums.count - 1, k: k, array: &array)
        }
        
        func sort(l: Int, r: Int, k: Int, array: inout [Int]) -> Int {
            let partition = self.partition(l: l, r: r, array: &array)
            
            if partition == r - k + 1 {
                return array[partition]
            } else if partition < r - k + 1 {
                return sort(l: partition + 1, r: r, k: k, array: &array)
            } else {
                return sort(l: l, r: partition - 1, k: k - (r - partition) - 1, array: &array)
            }
        }
        
        func partition(l: Int, r: Int, array: inout [Int]) -> Int {
            let pivot = array[r]
            var i: Int = l - 1
            
            for index in l..<r {
                if array[index] < pivot {
                    i += 1
                    array.swapAt(index, i)
                }
            }
            
            array.swapAt(i + 1, r)
            return i + 1
            
        }
    }
}

extension KthLargestElementInAnArray.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase2(input1: [3,2,1,5,6,4], input2: 2, result: 5, func2: self.findKthLargest),
            TestCase2(input1: [3,2,3,1,2,4,5,5,6], input2: 4, result: 4, func2: self.findKthLargest),
        ]
    }
}
