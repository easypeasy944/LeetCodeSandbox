//
//  Queue.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 18.01.2023.
//

import Foundation

struct Queue<T> {
    class Node {
        let val: T
        var next: Node?
        
        init(val: T, next: Node? = nil) {
            self.val = val
            self.next = next
        }
    }
    
    private var head: Node? = nil
    private var tail: Node? = nil
    private(set) var count: Int = 0
    private let size: Int
    
    var last: T? {
        return tail?.val
    }
    
    var first: T? {
        return head?.val
    }
    
    init(size: Int) {
        self.size = size
    }
    
    mutating func push(_ value: T) {
        if count == size {
            head = head?.next
        }
        let newNode = Node(val: value)
        
        if head == nil {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
        count = min(size, count + 1)
    }
    
    mutating func pop() -> T? {
        let value = head?.val
        head = head?.next
        if head == nil {
            tail = nil
        }
        count = max(0, count - 1)
        return value
    }
}
