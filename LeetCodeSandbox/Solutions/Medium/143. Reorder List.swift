//
//  143. Reorder List.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 29.12.2022.
//

import Foundation

enum ReorderList {
    
    class Solution {
    
        public class ListNode: Equatable {
            
            public var val: Int
            public var next: ListNode?
            public init() { self.val = 0; self.next = nil; }
            public init(_ val: Int) { self.val = val; self.next = nil; }
            public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
            
            static func ==(lhs: ListNode, rhs: ListNode) -> Bool {
                lhs.val == rhs.val &&
                lhs.next == rhs.next
            }
        }
        
        var l: ListNode?
        var r: ListNode?
        var head: ListNode?
        
        func reorderList(_ head: ListNode?) {
            guard let head = head else { return }
            
            self.head = head
            l = head
            r = head
            
            reorder(prev: nil)
        }
        
        func reorder(prev: ListNode?) {
            if r?.next == nil {
                return
            } else {
                r = r?.next
                reorder(prev: r)
                
                if l?.next === r || l === r {
                    return
                }
                prev?.next = nil
                let temp = l?.next
                l?.next = r
                r?.next = temp
                l = temp
                r = prev
            }
        }
        
        func _reorderList(_ head: ListNode?) -> ListNode? {
            reorderList(head)
            return head
        }
    }
}

extension ReorderList.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        let makeList: ([Int]) -> ListNode? = { nums in
            var head: ListNode? = nil
            var current: ListNode? = nil
            
            for num in nums {
                if head == nil {
                    head = ListNode(num)
                    current = head
                } else {
                    let newNode = ListNode(num)
                    current?.next = newNode
                    current = newNode
                }
            }
            return head
        }
        
        return [
            TestCase1(input1: makeList([1]), result: makeList([1]), func1: self._reorderList),
            TestCase1(input1: makeList([1,2]), result: makeList([1,2]), func1: self._reorderList),
            TestCase1(input1: makeList([1,2,3]), result: makeList([1,3,2]), func1: self._reorderList),
            TestCase1(input1: makeList([1,2,3,4]), result: makeList([1,4,2,3]), func1: self._reorderList),
            TestCase1(input1: makeList([1,2,3,4,5]), result: makeList([1,5,2,4,3]), func1: self._reorderList),
            TestCase1(input1: makeList([1,2,3,4,5,6]), result: makeList([1,6,2,5,3,4]), func1: self._reorderList)
        ]
    }
}
