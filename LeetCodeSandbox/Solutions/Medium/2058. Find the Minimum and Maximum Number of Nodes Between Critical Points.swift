//
//  2058. Find the Minimum and Maximum Number of Nodes Between Critical Points.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 18.01.2023.
//

import Foundation

enum FindTheMinimumAndMaximumNumberOfNodesBetweenCriticalPoints {
    
    class Solution {
        public class ListNode {
            public var val: Int
            public var next: ListNode?
            public init() { self.val = 0; self.next = nil; }
            public init(_ val: Int) { self.val = val; self.next = nil; }
            public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
        }
        
        func nodesBetweenCriticalPoints(_ head: ListNode?) -> [Int] {
            var prev: ListNode?
            var current: ListNode? = head
            
            var firstCriticalIndex: Int = -1
            var lastCriticalIndex: Int = -1
            var index: Int = 0
            
            var maxLength: Int = .min
            var minLength: Int = .max
            
            while current != nil {
                if let current = current, let prev = prev, let next = current.next {
                    if (current.val > prev.val && current.val > next.val) ||
                        (current.val < prev.val && current.val < next.val) {
                        
                        if firstCriticalIndex != -1 {
                            maxLength = index - firstCriticalIndex
                        } else {
                            firstCriticalIndex = index
                        }
                        if lastCriticalIndex != -1 {
                            minLength = min(minLength, index - lastCriticalIndex)
                        }
                        
                        lastCriticalIndex = index
                    }
                }
                
                index += 1
                prev = current
                current = current?.next
            }
            
            return [
                minLength == .max ? -1 : minLength,
                maxLength == .min ? -1 : maxLength
            ]
        }
    }
}

extension FindTheMinimumAndMaximumNumberOfNodesBetweenCriticalPoints.Solution: SolutionProtocol {
        
    func makeList(_ array: [Int]) -> ListNode? {
        var head: ListNode?
        var current: ListNode?
        
        array.forEach {
            let newNode = ListNode($0)
            
            if head == nil {
                head = newNode
                current = newNode
            } else {
                current?.next = newNode
                current = newNode
            }
        }
        
        return head
    }
    
    var testCases: [Validatable] {
        return [
            TestCase1(input1: makeList([5,3,1,2,5,1,2]), result: [1,3], func1: self.nodesBetweenCriticalPoints),
            TestCase1(input1: makeList([3,1]), result: [-1,-1], func1: self.nodesBetweenCriticalPoints),
            TestCase1(input1: makeList([1,3,2,2,3,2,2,2,7]), result: [3,3], func1: self.nodesBetweenCriticalPoints),
        ]
    }
}
