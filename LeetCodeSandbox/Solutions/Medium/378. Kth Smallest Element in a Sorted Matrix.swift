//
//  378. Kth Smallest Element in a Sorted Matrix.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 08.04.2023.
//

import Foundation

enum KthSmallestElementInASortedMatrix {
    class Solution {
        func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
            var heap = MinHeap(size: k)
            
            for i in 0..<matrix.count {
                for j in 0..<matrix[i].count {
                    heap.insert(matrix[i][j])
                }
            }
            
            return heap.max()!
        }
    }
}

extension KthSmallestElementInASortedMatrix.Solution: SolutionProtocol {
    
    var testCases: [Validatable] {
        return [
//            TestCase2(input1: [[1,5,9],[10,11,13],[12,13,15]], input2: 8, result: 13, func2: self.kthSmallest),
//            TestCase2(input1: [[-5]], input2: 1, result: -5, func2: self.kthSmallest),
            TestCase2(input1: [[1,2],[3,3]], input2: 3, result: 3, func2: self.kthSmallest),
        ]
    }
}

private struct MinHeap {
    var array: [Int]
    var count: Int
    
    init(size: Int) {
        self.array = Array(repeating: 0, count: size)
        self.count = 0
    }
    
    mutating func shiftUp(index: Int) {
        var index = index
        var parent = (index - 1) / 2
        
        while array[index] < array[parent] && index != 0 {
            swap(index, parent)
            index = parent
            parent = (parent + 1) / 2
        }
    }
    
    mutating func shiftDown(index: Int) {
        let leftChild = 2 * index + 1
        let rightChild = 2 * index + 2
        var swapIndex = index
        
        if leftChild < count && array[leftChild] < array[swapIndex] {
            swapIndex = leftChild
        }
        if rightChild < count &&  array[rightChild] < array[swapIndex] {
            swapIndex = rightChild
        }
        
        if swapIndex != index {
            swap(index, swapIndex)
            shiftDown(index: swapIndex)
        }
    }
    
    mutating func insert(_ value: Int) {
        if count + 1 <= array.count {
            array[count] = value
            count += 1
            shiftUp(index: count - 1)
        } else {
            let maxIndex = findMaxIndex(startIndex: 0)
            if array[maxIndex] > value {
                array[maxIndex] = value
                shiftUp(index: maxIndex)
            }
        }
    }
    
    func findMaxIndex(startIndex: Int) -> Int {
        let leftChild = 2 * startIndex + 1
        let rightChild = 2 * startIndex + 2
        
        var maxIndex: Int = startIndex
        
        if leftChild < count  {
            let leftMaxIndex = findMaxIndex(startIndex: leftChild)
            if array[leftMaxIndex] > array[maxIndex] {
                maxIndex = leftMaxIndex
            }
        }
        if rightChild < count {
            let rightMaxIndex = findMaxIndex(startIndex: rightChild)
            if array[rightMaxIndex] > array[maxIndex] {
                maxIndex = rightMaxIndex
            }
        }
        
        return maxIndex
    }
    
    func max() -> Int? {
        guard count > 0 else { return nil }
        return array[findMaxIndex(startIndex: 0)]
    }
    
    
    mutating func swap(_ i: Int, _ j: Int) {
        let temp = array[i]
        array[i] = array[j]
        array[j] = temp
    }
}
