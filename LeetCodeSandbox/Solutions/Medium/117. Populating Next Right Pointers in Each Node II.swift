//
//  117. Populating Next Right Pointers in Each Node II.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 29.10.2022.
//

import Foundation

enum PopulatingNextRightPointersInEachNodeII {
    
    class Solution {
        public class Node: Equatable {
            public var val: Int
            public var left: Node?
            public var right: Node?
            public var next: Node?
            public init(_ val: Int, _ left: Node? = nil, _ right: Node? = nil) {
                self.val = val
                self.left = left
                self.right = right
                self.next = nil
            }
            
            public static func == (lhs: PopulatingNextRightPointersInEachNodeII.Solution.Node, rhs: PopulatingNextRightPointersInEachNodeII.Solution.Node) -> Bool {
                lhs.val == rhs.val && lhs.left == rhs.left && lhs.right == rhs.right
            }
        }
        
        func connect(_ root: Node?) -> Node? {
            guard let root = root else { return nil }
            connect(nodes: [root])
            return root
        }
        
        private func connect(nodes: [Node]) {
            guard !nodes.isEmpty else { return }
            
            for i in 0..<(nodes.count - 1) {
                nodes[i].next = nodes[i + 1]
            }
            
            let children: [Node] = nodes.flatMap { return [$0.left, $0.right].compactMap { $0 } }
            connect(nodes: children)
        }
    }
}

extension PopulatingNextRightPointersInEachNodeII.Solution: SolutionProtocol {
    
    var testCases: [Validatable] {

        // Case 1
        
        let node6 = Node(6)
        let node5 = Node(5)
        let node4 = Node(4, node5, node6)
        let node3 = Node(3)
        let node2 = Node(2, node3, nil)
        let node1: Node? = Node(1, node2, node4)
        
        return [
            TestCase1(
                input1: node1,
                result: node1,
                func1: self.connect,
                comparator: { (result1: Node?, result2: Node?) -> Bool in
                    node2.next === node4 &&
                    node3.next === node5 &&
                    node5.next === node6
                }
            )
        ]
    }
}
