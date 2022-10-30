//
//  124. Binary Tree Maximum Path Sum.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 30.10.2022.
//

import Foundation

enum BinaryTreeMaximumPathSum {
    
    class Solution {
        public class TreeNode: Equatable {
            public static func == (lhs: BinaryTreeMaximumPathSum.Solution.TreeNode, rhs: BinaryTreeMaximumPathSum.Solution.TreeNode) -> Bool {
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
        
        func maxPathSum(_ root: TreeNode?) -> Int {
            guard let root = root else { return 0 }
            
            var maxSum: Int = root.val
            return max(calculateMaxSum(root, maxSum: &maxSum), maxSum)
        }
        
        private func calculateMaxSum(_ root: TreeNode?, maxSum: inout Int) -> Int {
            guard let root = root else { return 0 }
            
            let leftSubtreeMaxSum = calculateMaxSum(root.left, maxSum: &maxSum)
            let rightSubtreeMaxSum = calculateMaxSum(root.right, maxSum: &maxSum)
            
            let currentMax = max(root.val, max(root.val + leftSubtreeMaxSum, root.val + rightSubtreeMaxSum))
            maxSum = max(maxSum, root.val + leftSubtreeMaxSum + rightSubtreeMaxSum)
            maxSum = max(maxSum, currentMax)
            
            return currentMax
        }
    }
}

extension BinaryTreeMaximumPathSum.Solution: SolutionProtocol {
    
    var testCases: [Validatable] {
        
        // Case 1
        
        let tree1 = TreeNode(
            -5,
             TreeNode(
                -1,
                 TreeNode(
                    3,
                    TreeNode(0),
                    TreeNode(4)
                 ),
                 TreeNode(
                    2,
                    TreeNode(1),
                    TreeNode(3)
                 )
             ),
             TreeNode(
                -2,
                 TreeNode(
                    4,
                    TreeNode(-1),
                    TreeNode(2)
                 ),
                 TreeNode(
                    7,
                    TreeNode(5),
                    TreeNode(-5)
                 )
             )
        )
        
        // Case 2
        
        let tree2 = TreeNode(
            1,
            TreeNode(2),
            TreeNode(3)
        )
        
        // Case 3
        
        let tree3 = TreeNode(
            -10,
             TreeNode(9),
             TreeNode(
                20,
                TreeNode(15),
                TreeNode(7)
             )
        )
        
        // Case 4
        
        let tree4 = TreeNode(
            1,
            TreeNode(-2),
            TreeNode(3)
        )
        
        return [
            TestCase1(
                input1: tree1,
                result: 16,
                func1: self.maxPathSum
            ),
            TestCase1(
                input1: tree2,
                result: 6,
                func1: self.maxPathSum
            ),
            TestCase1(
                input1: tree3,
                result: 42,
                func1: self.maxPathSum
            ),
            TestCase1(
                input1: tree4,
                result: 4,
                func1: self.maxPathSum
            )
        ]
    }
}
