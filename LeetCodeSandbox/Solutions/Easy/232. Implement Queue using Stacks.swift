//
//  232. Implement Queue using Stacks.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 22.01.2023.
//

import Foundation

enum ImplementQueueUsingStacks {
    
    class Solution {
        struct Stack<T> {
            class Node {
                let value: T
                var next: Node?
                
                init(value: T, next: Node? = nil) {
                    self.value = value
                    self.next = next
                }
            }
            
            private var head: Node? = nil
            
            init() { }
            
            mutating func push(_ x: T) {
                let newNode = Node(value: x, next: head)
                head = newNode
            }
            
            mutating func pop() -> T? {
                let value = head?.value
                head = head?.next
                return value
            }
            
            func peek() -> T? {
                head?.value
            }
            
            func empty() -> Bool {
                head == nil
            }
        }
        
        class MyQueue {

            private var primaryStack = Stack<Int>()
            private var secondaryStack = Stack<Int>()
            
            init() { }
            
            func push(_ x: Int) {
                primaryStack.push(x)
            }
            
            func pop() -> Int {
                while !primaryStack.empty() {
                    let value = primaryStack.pop()!
                    secondaryStack.push(value)
                }
                
                let value = secondaryStack.pop()!
                
                while !secondaryStack.empty() {
                    let value = secondaryStack.pop()!
                    primaryStack.push(value)
                }
                
                return value
            }
            
            func peek() -> Int {
                while !primaryStack.empty() {
                    let value = primaryStack.pop()!
                    secondaryStack.push(value)
                }
                
                let value = secondaryStack.peek()!
                
                while !secondaryStack.empty() {
                    let value = secondaryStack.pop()!
                    primaryStack.push(value)
                }
                
                return value
            }
            
            func empty() -> Bool {
                primaryStack.empty()
            }
        }
        
        enum Action: Hashable {
            case initialize
            case push(Int)
            case pop
            case peek
            case empty
        }
        
        enum Result: Hashable {
            case initialize
            case push
            case pop(Int)
            case peek(Int)
            case empty(Bool)
        }
        
        func run(_ actions: [Action]) -> [Result] {
            var queue: MyQueue!
            
            return actions.map { action in
                switch action {
                case .initialize:
                    queue = MyQueue()
                    return .initialize
                    
                case .empty:
                    return .empty(queue.empty())
                    
                case .peek:
                    return .peek(queue.peek())
                    
                case .pop:
                    return .pop(queue.pop())
                    
                case .push(let value):
                    queue.push(value)
                    return .push
                }
            }
        }
    }
}

extension ImplementQueueUsingStacks.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(
                input1: [
                    .initialize,
                    .push(1),
                    .push(2),
                    .peek,
                    .pop,
                    .empty
                ],
                result: [
                    .initialize,
                    .push,
                    .push,
                    .peek(1),
                    .pop(1),
                    .empty(false)
                ],
                func1: self.run
            )
        ]
    }
}
