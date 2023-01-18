//
//  19. Remove Nth Node From End of List.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 18.01.2023.
//

import Foundation

enum RemoveNthNodeFromEndOfList {
    
    class Solution {
        public class ListNode: Equatable {
            public static func == (lhs: RemoveNthNodeFromEndOfList.Solution.ListNode, rhs: RemoveNthNodeFromEndOfList.Solution.ListNode) -> Bool {
                lhs.val == rhs.val && lhs.next == rhs.next
            }
            
            public var val: Int
            public var next: ListNode?
            public init() { self.val = 0; self.next = nil; }
            public init(_ val: Int) { self.val = val; self.next = nil; }
            public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
        }
        
        func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
            var head = head
            if head == nil {
                return nil
            }
            
            var queue = Queue<ListNode>(size: n + 1)
            var current: ListNode? = head
            while current != nil {
                queue.push(current!)
                current = current?.next
            }
            
            if queue.count == n + 1 {
                let prev = queue.first
                prev?.next = prev?.next?.next
            } else if queue.count == n {
                head = queue.first?.next
            } else {
                head = nil
            }
            
            return head
        }
    }
}

extension RemoveNthNodeFromEndOfList.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        // Case 1
        
        let head1 = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
        let head2 = ListNode(1, ListNode(2, ListNode(3, ListNode(5))))
        
        // Case 2
        
        let head3 = ListNode(1)
        let head4: ListNode? = nil
        
        // Case 3
        
        let head5 = ListNode(1, ListNode(2))
        let head6 = ListNode(1)
        
        // Case 4
        
        let head7 = ListNode(1, ListNode(2))
        let head8 = ListNode(2)
        
        return [
            TestCase2(input1: head1, input2: 2, result: head2, func2: self.removeNthFromEnd),
            TestCase2(input1: head3, input2: 1, result: head4, func2: self.removeNthFromEnd),
            TestCase2(input1: head5, input2: 1, result: head6, func2: self.removeNthFromEnd),
            TestCase2(input1: head7, input2: 2, result: head8, func2: self.removeNthFromEnd),
        ]
    }
}
