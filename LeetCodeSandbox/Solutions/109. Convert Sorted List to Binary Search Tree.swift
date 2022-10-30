//
//  109. Convert Sorted List to Binary Search Tree.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 30.10.2022.
//

import Foundation

enum ConvertSortedListToBinarySearchTree {
    
    class Solution {
        public class ListNode {
            public var val: Int
            public var next: ListNode?
            public init() { self.val = 0; self.next = nil; }
            public init(_ val: Int) { self.val = val; self.next = nil; }
            public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
        }
        
        public class TreeNode: Equatable {
            public static func == (lhs: ConvertSortedListToBinarySearchTree.Solution.TreeNode, rhs: ConvertSortedListToBinarySearchTree.Solution.TreeNode) -> Bool {
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
         
        func sortedListToBST(_ head: ListNode?) -> TreeNode? {
            guard let head = head else { return nil }
            
            var count: Int = 0
            var currentNode: ListNode? = head
            while currentNode != nil {
                count += 1
                currentNode = currentNode?.next
            }
            
            let root = buildBST(startIndex: 0, endIndex: count - 1, head: head, isLeftSubtree: true)
            return root
        }
        
        private func buildBST(startIndex: Int, endIndex: Int, head: ListNode, isLeftSubtree: Bool) -> TreeNode {
            switch endIndex - startIndex {
            case 0:
                return TreeNode(head.val)
            
            case 1:
                if isLeftSubtree {
                    let leftNode = TreeNode(head.val)
                    return TreeNode(head.next!.val, leftNode, nil)
                } else {
                    let rightNode = TreeNode(head.next!.val)
                    return TreeNode(head.val, nil, rightNode)
                }
                
            case 2:
                let leftNode = TreeNode(head.val)
                let rightNode = TreeNode(head.next!.next!.val)
                return TreeNode(head.next!.val, leftNode, rightNode)
                
            default:
                let middleIndex: Int = startIndex + Int((endIndex - startIndex) / 2)
                
                let left = buildBST(startIndex: startIndex, endIndex: middleIndex - 1, head: head, isLeftSubtree: true)
                var middleNode: ListNode? = head
                for _ in 0..<(middleIndex - startIndex) { middleNode = middleNode?.next }
                let right = buildBST(startIndex: middleIndex + 1, endIndex: endIndex, head: middleNode!.next!, isLeftSubtree: false)
                
                return TreeNode(
                    middleNode!.val,
                    left,
                    right
                )
            }
        }
        
        private func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
            if p == nil && q == nil { return true }
            if p == nil || q == nil { return false }
            if p?.val != q?.val { return false }
            
            return isSameTree(p!.left, q!.left) && isSameTree(p!.right, q!.right)
        }
    }
}

extension ConvertSortedListToBinarySearchTree.Solution: SolutionProtocol {
    
    private func buildList(_ array: [Int]) -> ListNode? {
        guard !array.isEmpty else { return nil }
        
        var rootNode: ListNode?
        var currentNode: ListNode?
        
        array.forEach { value in
            if rootNode == nil {
                rootNode = ListNode(value)
                currentNode = rootNode
            } else {
                let newNode = ListNode(value)
                currentNode?.next = newNode
                currentNode = newNode
            }
        }
        
        return rootNode
    }
    
    var testCases: [Validatable] {

        // Case 1
        
        let list1 = buildList([-10, -3, 0, 5, 9])
        let tree1 = TreeNode(
            0,
            TreeNode(
                -3,
                 TreeNode(-10),
                 nil
            ),
            TreeNode(
                9,
                TreeNode(5),
                nil
            )
        )
        
        // Case 2
        
        let list2 = buildList([1, 50, 100, 200, 300, 500, 600])
        let tree2 = TreeNode(
            200,
            TreeNode(
                50,
                TreeNode(1),
                TreeNode(100)
            ),
            TreeNode(
                500,
                TreeNode(300),
                TreeNode(600)
            )
        )
        
        // Case 3
        
        let list3 = buildList([0,1,2,3,4,5,6,7])
        let tree3 = TreeNode(
            3,
            TreeNode(
                1,
                TreeNode(0),
                TreeNode(2)
            ),
            TreeNode(
                5,
                TreeNode(4),
                TreeNode(
                    6,
                    nil,
                    TreeNode(7)
                )
            )
        )
        
    
        return [
            TestCase1(
                input1: list1,
                result: tree1,
                func1: self.sortedListToBST,
                comparator: { (lhsTree: TreeNode?, rhsTree: TreeNode?) -> Bool in
                    self.isSameTree(lhsTree, rhsTree)
                }
            ),
            TestCase1(
                input1: list2,
                result: tree2,
                func1: self.sortedListToBST,
                comparator: { (lhsTree: TreeNode?, rhsTree: TreeNode?) -> Bool in
                    self.isSameTree(lhsTree, rhsTree)
                }
            ),
            TestCase1(
                input1: list3,
                result: tree3,
                func1: self.sortedListToBST,
                comparator: { (lhsTree: TreeNode?, rhsTree: TreeNode?) -> Bool in
                    self.isSameTree(lhsTree, rhsTree)
                }
            )
        ]
    }
}
