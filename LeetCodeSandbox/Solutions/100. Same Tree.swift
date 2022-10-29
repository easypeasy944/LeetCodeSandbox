//
//  100. Same Tree.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 29.10.2022.
//

import Foundation

enum SameTree {
    
    class Solution {
        class TreeNode {
            public var val: Int
            public var left: TreeNode?
            public var right: TreeNode?
            public init() { self.val = 0; self.left = nil; self.right = nil; }
            public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
            public init(_ val: Int, _ left: TreeNode? = nil, _ right: TreeNode? = nil) {
                self.val = val
                self.left = left
                self.right = right
            }
        }
        
        func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
            if p == nil && q == nil { return true }
            if p == nil || q == nil { return false }
            
            var leftTreeTraverseResult: [Int?] = []
            traverse(rootNode: p!, result: &leftTreeTraverseResult)
            
            var rightTreeTraverseResult: [Int?] = []
            traverse(rootNode: q!, result: &rightTreeTraverseResult)
            
            return leftTreeTraverseResult == rightTreeTraverseResult
        }
        
        func isSameTree2(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
            if p == nil && q == nil { return true }
            if p == nil || q == nil { return false }
            if p?.val != q?.val { return false }
            
            return isSameTree2(p!.left, q!.left) && isSameTree2(p!.right, q!.right)
        }
        
        private func traverse(rootNode: TreeNode, result: inout [Int?]) {
            if rootNode.left == nil && rootNode.right == nil {
                result.append(rootNode.val)
                return
            }
            
            if let leftNode = rootNode.left {
                traverse(rootNode: leftNode, result: &result)
            } else {
                result.append(nil)
            }
            if let rightNode = rootNode.right {
                traverse(rootNode: rightNode, result: &result)
            } else {
                result.append(nil)
            }
            
            result.append(rootNode.val)
        }
    }
}

extension SameTree.Solution: SolutionProtocol {
    var testCases: [Validatable] {

        // Case 1
        
        let tree1Q = TreeNode(
            0,
            TreeNode(
                1,
                TreeNode(2),
                TreeNode(3)
            ),
            TreeNode(
                4,
                TreeNode(5),
                TreeNode(6)
            )
        )
        
        let tree1P = TreeNode(
            0,
            TreeNode(
                1,
                TreeNode(2),
                TreeNode(3)
            ),
            TreeNode(
                4,
                TreeNode(5),
                TreeNode(6)
            )
        )
        
        // Case 2
                
        let tree2Q = TreeNode(
            0,
            TreeNode(
                1,
                TreeNode(2),
                TreeNode(3)
            ),
            TreeNode(
                4,
                TreeNode(6)
            )
        )
        
        let tree2P = TreeNode(0)
        
        // Case 3
        
        let tree3Q = TreeNode(
            0,
            TreeNode(
                1,
                nil,
                TreeNode(2)
            ),
            TreeNode(
                3,
                TreeNode(4),
                nil
            )
        )
        
        let tree3P = TreeNode(
            0,
            TreeNode(
                1,
                TreeNode(2),
                nil
            ),
            TreeNode(
                3,
                nil,
                TreeNode(4)
            )
        )
        
        return [
            TestCase2(input1: tree1Q, input2: tree1P, result: true, func2: self.isSameTree2),
            TestCase2(input1: tree2Q, input2: tree2P, result: false, func2: self.isSameTree2),
            TestCase2(input1: tree3Q, input2: tree3P, result: false, func2: self.isSameTree2)
        ]
    }
}
