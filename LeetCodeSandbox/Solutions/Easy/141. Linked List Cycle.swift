//
//  141. Linked List Cycle.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 18.01.2023.
//

import Foundation

enum LinkedListCycle {
    
    class Solution {
        class ListNode {
            public var val: Int
            public var next: ListNode?
            public init(_ val: Int) {
                self.val = val
                self.next = nil
            }
        }
        
        func hasCycle(_ head: ListNode?) -> Bool {
            guard let head = head else { return false }
            
            var slow: ListNode? = head
            var fast: ListNode? = head.next?.next
            
            while fast != nil && slow != nil {
                if fast === slow {
                    return true
                }
                
                slow = slow?.next
                fast = fast?.next?.next
            }
            
            return false
        }
    }
}

extension LinkedListCycle.Solution: SolutionProtocol {

    var testCases: [Validatable] {
        // Case 1
        
        let node1 = ListNode(3)
        let node2 = ListNode(2)
        let node3 = ListNode(0)
        let node4 = ListNode(-4)
        
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node2
        
        // Case 2
        
        let node5 = ListNode(1)
        let node6 = ListNode(2)
        
        node5.next = node6
        node6.next = node5
        
        return [
            TestCase1(input1: node1, result: true, func1: self.hasCycle),
            TestCase1(input1: node5, result: true, func1: self.hasCycle),
        ]
    }
}
