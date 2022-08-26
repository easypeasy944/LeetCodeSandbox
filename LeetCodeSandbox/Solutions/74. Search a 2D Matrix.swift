//
//  74. Search a 2D Matrix.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 26.08.2022.
//

import Foundation

enum SearchA2DMatrix {
    
    class Solution {
        func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
            return searchArray(matrix: matrix, startIndex: 0, endIndex: matrix.count - 1, target: target)
        }
        
        func searchArray(matrix: [[Int]], startIndex: Int, endIndex: Int, target: Int) -> Bool {
            if startIndex == endIndex {
                return search(array: matrix[startIndex], startIndex: 0, endIndex:  matrix[startIndex].count - 1, target: target)
            } else {
                let middle = (endIndex - startIndex) / 2
                if matrix[startIndex].first!...matrix[startIndex + middle].last! ~= target {
                    return searchArray(matrix: matrix, startIndex: startIndex, endIndex: startIndex + middle, target: target)
                } else {
                    return searchArray(matrix: matrix, startIndex: startIndex + middle + 1, endIndex: endIndex, target: target)
                }
            }
        }
        
        func search(array: [Int], startIndex: Int, endIndex: Int, target: Int) -> Bool {
            if startIndex == endIndex {
                return array[startIndex] == target
            } else {
                let middle = (endIndex - startIndex) / 2
                if array[startIndex]...array[startIndex + middle] ~= target {
                    return search(array: array, startIndex: startIndex, endIndex: startIndex + middle, target: target)
                } else {
                    return search(array: array, startIndex: startIndex + middle + 1, endIndex: endIndex, target: target)
                }
            }
        }
    }
}

extension SearchA2DMatrix.Solution: SolutionProtocol {
    var testCases: [Validatable] {
        return [
            TestCase2(input1: [[1]], input2: 3, result: false, func2: self.searchMatrix),
            TestCase2(input1: [[1,3,5,7],[10,11,16,20],[23,30,34,60]], input2: 3, result: true, func2: self.searchMatrix),
            TestCase2(input1: [[1,3,5,7],[10,11,16,20],[23,30,34,60]], input2: 12, result: false, func2: self.searchMatrix),
            TestCase2(input1: [[1,3,5,7],[10,11,16,20],[23,30,34,60]], input2: 0, result: false, func2: self.searchMatrix),
            TestCase2(input1: [[1,3,5,7],[10,11,16,20],[23,30,34,60],[73,80,94,1000]], input2: 21, result: false, func2: self.searchMatrix),
        ]
    }
}
