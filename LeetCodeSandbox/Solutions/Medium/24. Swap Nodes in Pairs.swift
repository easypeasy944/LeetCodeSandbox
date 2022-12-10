//
//  24. Swap Nodes in Pairs.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 10.12.2022.
//

import Foundation

enum SwapNodesInPairs {
    
    class Solution {
        public class ListNode: Equatable {
            public var val: Int
            public var next: ListNode?
            public init() { self.val = 0; self.next = nil; }
            public init(_ val: Int) { self.val = val; self.next = nil; }
            public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
            
            public static func == (lhs: SwapNodesInPairs.Solution.ListNode, rhs: SwapNodesInPairs.Solution.ListNode) -> Bool {
                lhs.val == rhs.val && lhs.next == rhs.next
            }
        }
        
        
        func swapPairs(_ head: ListNode?) -> ListNode? {
            var originalHead = head
            
            var resultHead: ListNode?
            var resultCurrent: ListNode?
            
            while originalHead != nil && originalHead?.next != nil {
                let node1 = ListNode(originalHead!.next!.val)
                let node2 = ListNode(originalHead!.val)
                node1.next = node2
                
                if resultCurrent == nil {
                    resultHead = node1
                    resultCurrent = node2
                } else {
                    resultCurrent?.next = node1
                    resultCurrent = node2
                }
                
                originalHead = originalHead?.next?.next
            }
            
            if originalHead != nil {
                if resultHead == nil {
                    resultHead = ListNode(originalHead!.val)
                } else {
                    resultCurrent?.next = ListNode(originalHead!.val)
                }
            }
            
            return resultHead
        }
    }
}

extension SwapNodesInPairs.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        func buildList(_ array: [Int]) -> ListNode? {
            var head: ListNode? = nil
            var current: ListNode? = nil
            array.forEach {
                let newNode = ListNode($0)
                if current == nil {
                    head = newNode
                    current = head
                } else {
                    current?.next = newNode
                    current = newNode
                }
            }
            return head
        }
        
        return [
            TestCase1(input1: buildList([1,2,3]), result: buildList([2,1,3]), func1: self.swapPairs),
            TestCase1(input1: buildList([1,2,3,4]), result: buildList([2,1,4,3]), func1: self.swapPairs),
            TestCase1(input1: buildList([1]), result: buildList([1]), func1: self.swapPairs)
        ]
    }
}
