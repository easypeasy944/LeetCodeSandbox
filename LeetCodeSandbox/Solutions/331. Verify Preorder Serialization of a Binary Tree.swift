//
//  331. Verify Preorder Serialization of a Binary Tree.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 30.10.2022.
//

import Foundation

enum VerifyPreorderSerializationOfABinaryTree {
    
    class Solution {
        func isValidSerialization(_ preorder: String) -> Bool {
            var array: [String] = preorder.components(separatedBy: ",")
            
            return buildSubtree(&array) && array.isEmpty
        }
        
        private func buildSubtree(_ array: inout [String]) -> Bool {
            guard !array.isEmpty else { return true }
            
            if array.first != "#" {
                array = Array(array.dropFirst())
                
                var result: Bool = true
                
                if array.first == "#" {
                    array = Array(array.dropFirst())
                } else {
                    // Building left subtree
                    result = result && buildSubtree(&array)
                }
                
                if array.first == nil {
                    return false
                } else if array.first == "#" {
                    array = Array(array.dropFirst())
                } else {
                    // Building right subtree
                    result = result && buildSubtree(&array)
                }
                
                return result
            } else {
                if array.count == 1 {
                    array = Array(array.dropFirst())
                    return true
                } else {
                    return false
                }
            }
        }
    }
}

extension VerifyPreorderSerializationOfABinaryTree.Solution: SolutionProtocol {
    
    var testCases: [Validatable] {
        return [
            TestCase1(
                input1: "9,3,4,#,#,1,#,#,2,#,6,#,#",
                result: true,
                func1: self.isValidSerialization
            ),
            TestCase1(
                input1: "1,#",
                result: false,
                func1: self.isValidSerialization
            ),
            TestCase1(
                input1: "9,#,#,1",
                result: false,
                func1: self.isValidSerialization
            ),
            TestCase1(
                input1: "#",
                result: true,
                func1: self.isValidSerialization
            )
        ]
    }
}
