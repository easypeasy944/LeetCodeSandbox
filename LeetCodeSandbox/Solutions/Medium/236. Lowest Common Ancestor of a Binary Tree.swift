//
//  236. Lowest Common Ancestor of a Binary Tree.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 22.12.2022.
//

import Foundation

enum LowestCommonAncestorOfABinaryTree {
    
    class Solution {
        public class TreeNode: Equatable {
            public static func == (
                lhs: TreeNode,
                rhs: TreeNode
            ) -> Bool {
                lhs.val == rhs.val &&
                lhs.left == rhs.left &&
                lhs.right == rhs.right
            }
            
            public var val: Int
            public var left: TreeNode?
            public var right: TreeNode?
            public init(_ val: Int, _ left: TreeNode? = nil, _ right: TreeNode? = nil) {
                self.val = val
                self.left = left
                self.right = right
            }
        }
        
        func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
            let (pPath, qPath) = findPath(root!, p!, q!)
            for i in (0..<min(pPath!.count, qPath!.count)).reversed() {
                if pPath![i].val == qPath![i].val {
                    return pPath![i]
                }
            }
            
            return nil
        }
        
        func findPath(_ root: TreeNode, _ p: TreeNode, _ q: TreeNode) -> ([TreeNode]?, [TreeNode]?) {
            var pResult: [TreeNode]?
            var qResult: [TreeNode]?
            
            var leftPath: ([TreeNode]?, [TreeNode]?)? = nil
            var rightPath: ([TreeNode]?, [TreeNode]?)? = nil
            
            if let left = root.left {
                leftPath = findPath(left, p, q)
            }
            if let right = root.right {
                rightPath = findPath(right, p, q)
            }
            
            if root.val == p.val {
                pResult = [root]
            } else if let path = (leftPath?.0 ?? rightPath?.0) {
                pResult = [root] + path
            }
            
            if root.val == q.val {
                qResult = [root]
            } else if let path = (leftPath?.1 ?? rightPath?.1) {
                qResult = [root] + path
            }

            return (pResult, qResult)
        }
    }
}

extension LowestCommonAncestorOfABinaryTree.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        // Case 1
        
        let tree1 = TreeNode(
            3,
            TreeNode(
                5,
                TreeNode(6),
                TreeNode(
                    2,
                    TreeNode(7),
                    TreeNode(4)
                )
            ),
            TreeNode(
                1,
                TreeNode(0),
                TreeNode(8)
            )
        )
        
        let comparator: (TreeNode?, TreeNode?) -> Bool = { lhs, rhs in
            return lhs?.val == rhs?.val
        }
        
        return [
            TestCase3(
                input1: tree1,
                input2: TreeNode(6),
                input3: TreeNode(4),
                result: TreeNode(5),
                func3: self.lowestCommonAncestor,
                comparator: comparator
            ),
            TestCase3(
                input1: tree1,
                input2: TreeNode(5),
                input3: TreeNode(1),
                result: TreeNode(3),
                func3: self.lowestCommonAncestor,
                comparator: comparator
            ),
            TestCase3(
                input1: tree1,
                input2: TreeNode(3),
                input3: TreeNode(5),
                result: TreeNode(3),
                func3: self.lowestCommonAncestor,
                comparator: comparator
            )
        ]
    }
}
