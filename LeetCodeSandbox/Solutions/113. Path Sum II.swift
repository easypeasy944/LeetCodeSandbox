//
//  113. Path Sum II.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 29.10.2022.
//

import Foundation

enum PathSumII {
    
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
        
        func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
            guard let root else { return [] }
            
            var paths: [[Int]] = []
            traverse(rootNode: root, currentSum: 0, targetSum: targetSum, currentPath: [], paths: &paths)
            return paths
        }
        
        private func traverse(
            rootNode: TreeNode,
            currentSum: Int,
            targetSum: Int,
            currentPath: [Int],
            paths: inout [[Int]]
        ) {
            if rootNode.left == nil && rootNode.right == nil {
                if currentSum + rootNode.val == targetSum {
                    paths.append(currentPath + [rootNode.val])
                }
                return
            }
            
            if let left = rootNode.left {
                traverse(
                    rootNode: left,
                    currentSum: currentSum + rootNode.val,
                    targetSum: targetSum,
                    currentPath: currentPath + [rootNode.val],
                    paths: &paths
                )
            }
            if let right = rootNode.right {
                traverse(
                    rootNode: right,
                    currentSum: currentSum + rootNode.val,
                    targetSum: targetSum,
                    currentPath: currentPath + [rootNode.val],
                    paths: &paths
                )
            }
        }
    }
}

extension PathSumII.Solution: SolutionProtocol {
    
    var testCases: [Validatable] {

        // Case 1
        
        let tree1: TreeNode? = TreeNode(
            -1,
            TreeNode(
                2,
                TreeNode(-3),
                TreeNode(
                    4,
                    nil,
                    TreeNode(5)
                )
            ),
            TreeNode(11)
        )
        
        // Case 2
        
        let tree2: TreeNode? = TreeNode(10)
        
        return [
            TestCase2(input1: tree1, input2: 10, result: [[-1, 2, 4, 5], [-1, 11]], func2: self.pathSum),
            TestCase2(input1: tree2, input2: 10, result: [[10]], func2: self.pathSum)
        ]
    }
}
