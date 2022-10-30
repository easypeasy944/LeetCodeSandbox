//
//  222. Count Complete Tree Nodes.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 30.10.2022.
//

import Foundation

enum CountCompleteTreeNodes {
    
    class Solution {
        
        public class TreeNode: Equatable {
            public static func == (lhs: CountCompleteTreeNodes.Solution.TreeNode, rhs: CountCompleteTreeNodes.Solution.TreeNode) -> Bool {
                lhs.val == rhs.val &&
                lhs.left == rhs.left &&
                lhs.right == rhs.right
            }
            
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
         
        func countNodes(_ root: TreeNode?) -> Int {
            guard let root = root else { return 0 }
            
            let count = calculateNodesCount(root)
            return count
        }
        
        private func calculateNodesCount(_ rootNode: TreeNode?) -> Int {
            guard let rootNode = rootNode else { return 0 }
            
            let rightSubtreeNodesCount = calculateNodesCount(rootNode.right)
            let leftSubtreeNodesCount = calculateNodesCount(rootNode.left)
            
            return rightSubtreeNodesCount + leftSubtreeNodesCount + 1
        }
    }
}

extension CountCompleteTreeNodes.Solution: SolutionProtocol {
    
    var testCases: [Validatable] {

        // Case 1
        
        let tree1 = TreeNode(
            3,
            TreeNode(
                1,
                TreeNode(0),
                TreeNode(2)
            ),
            TreeNode(
                5,
                TreeNode(4),
                TreeNode(6)
            )
        )
        
    
        return [
            TestCase1(
                input1: tree1,
                result: 7,
                func1: self.countNodes
            )
        ]
    }
}
