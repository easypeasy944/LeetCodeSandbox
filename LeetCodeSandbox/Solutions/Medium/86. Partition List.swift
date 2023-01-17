//
//  86. Partition List.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 17.01.2023.
//

import Foundation

enum PartitionList {
    
    class Solution {
        class ListNode: Equatable {
            static func == (lhs: PartitionList.Solution.ListNode, rhs: PartitionList.Solution.ListNode) -> Bool {
                lhs.val == rhs.val && lhs.next == rhs.next
            }
            
            public var val: Int
            public var next: ListNode?
            public init() { self.val = 0; self.next = nil; }
            public init(_ val: Int) { self.val = val; self.next = nil; }
            public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
        }
        
        func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
            if head == nil {
                return nil
            }
            
            var newHead: ListNode? = head
            var current: ListNode? = head
            var prev: ListNode? = nil
            var pointer: ListNode? = nil
            var pivot: ListNode? = nil
            
            while current != nil {
                if pivot != nil {
                    if current!.val < x {
                        let node = current
                        
                        if pointer != nil {
                            prev?.next = current?.next
                            current = node?.next
                            pointer?.next = node
                            node?.next = pivot
                            pointer = pointer?.next
                        } else {
                            newHead = node
                            pointer = node
                            prev?.next = current?.next
                            current = node?.next
                            pointer?.next = head
                        }
                    } else {
                        prev = current
                        current = current?.next
                    }
                } else {
                    if current!.val >= x {
                        pivot = current
                        pointer = prev
                    }
                    prev = current
                    current = current?.next
                }
            }
            
            return newHead
        }
    }
}

extension PartitionList.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        // Case 1
        
        let node = ListNode(
            10,
            ListNode(
                4,
                ListNode(
                    3,
                    ListNode(
                        2,
                        ListNode(
                            5,
                            ListNode(2)
                        )
                    )
                )
            )
        )
        
        let expectedNode = ListNode(
            2,
            ListNode(
                2,
                ListNode(
                    10,
                    ListNode(
                        4,
                        ListNode(
                            3,
                            ListNode(5)
                        )
                    )
                )
            )
        )
        
        return [
            TestCase2(input1: node, input2: 3, result: expectedNode, func2: self.partition)
        ]
    }
}
