//
//  146. LRU Cache.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 04.01.2023.
//

import Foundation

enum LRUCache {
    
    class LRUCache {
        class Node {
            let value: Int
            var next: Node?
            var prev: Node?
            
            init(value: Int, next: Node? = nil, prev: Node? = nil) {
                self.value = value
                self.next = next
                self.prev = prev
            }
        }
        
        class Weak<T: AnyObject> {
            weak var value: T?
            
            init(_ value: T? = nil) {
                self.value = value
            }
        }
        
        let capacity: Int
        var size: Int = 0
        var map: [Int: Weak<Node>] = [:]
        var head: Node?
        var tail: Node?
        
        init(_ capacity: Int) {
            self.capacity = capacity
        }
        
        func get(_ key: Int) -> Int {
            if let weakNode = map[key], let node = weakNode.value {
                deleteNode(node)
                let node = appendNode(node.value)
                map[key] = Weak(node)
                return node.value
            } else {
                map.removeValue(forKey: key)
                return -1
            }
        }
        
        func put(_ key: Int, _ value: Int) {
            if let weakNode = map[key], let node = weakNode.value {
                deleteNode(node)
                map.removeValue(forKey: key)
            }
            
            if size == capacity {
                deleteNode(head!)
            }
            let node = appendNode(value)
            map[key] = Weak(node)
        }
        
        private func deleteNode(_ node: Node) {
            if node === head {
                if tail === head {
                    head = nil
                    tail = nil
                } else {
                    head = head?.next
                    head?.prev = nil
                }
            } else if node === tail {
                tail = tail?.prev
                tail?.next = nil
            } else {
                let prev = node.prev
                let next = node.next
                
                prev?.next = next
                next?.prev = prev
            }
            
            size -= 1
        }
        
        private func appendNode(_ val: Int) -> Node {
            let newNode = Node(value: val)
            
            if tail == nil {
                head = newNode
                tail = newNode
            } else if tail === head {
                tail = newNode
                tail?.prev = head
                head?.next = tail
            } else {
                tail?.next = newNode
                newNode.prev = tail
                tail = newNode
            }

            size += 1
            return newNode
        }
    }
    
    class Solution {
        enum Action: Equatable {
            case initCapacity(Int)
            case put(key: Int, value: Int)
            case get(key: Int)
        }
        
        enum Result: Equatable {
            case initCapacity
            case put
            case get(value: Int)
        }
        
        func run(_ actions: [Action]) -> [Result] {
            var cache: LRUCache?
            
            return actions.map {
                switch $0 {
                case .initCapacity(let capacity):
                    cache = LRUCache(capacity)
                    return .initCapacity
                    
                case .get(let key):
                    let result = cache!.get(key)
                    return .get(value: result)
                    
                case let .put(key, value):
                    cache!.put(key, value)
                    return .put
                }
            }
        }
    }
}

extension LRUCache.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(
                input1: [
                    .initCapacity(2),
                    .put(key: 2, value: 1),
                    .put(key: 2, value: 2),
                    .get(key: 2),
                    .put(key: 1, value: 1),
                    .put(key: 4, value: 1),
                    .get(key: 2),
                ],
                result: [
                    .initCapacity,
                    .put,
                    .put,
                    .get(value: 2),
                    .put,
                    .put,
                    .get(value: -1)
                ],
                func1: self.run
            ),
//            TestCase1(
//                input1: [
//                    .initCapacity(1),
//                    .put(key: 2, value: 1),
//                    .get(key: 2),
//                    .put(key: 3, value: 2),
//                    .get(key: 2),
//                    .get(key: 3),
//                ],
//                result: [
//                    .initCapacity,
//                    .put,
//                    .get(value: 1),
//                    .put,
//                    .get(value: -1),
//                    .get(value: 2)
//                ],
//                func1: self.run
//            ),
//            TestCase1(
//                input1: [
//                    .initCapacity(2),
//                    .put(key: 1, value: 1),
//                    .put(key: 2, value: 2),
//                    .get(key: 1),
//                    .put(key: 3, value: 3),
//                    .get(key: 2),
//                    .put(key: 4, value: 4),
//                    .get(key: 1),
//                    .get(key: 3),
//                    .get(key: 4),
//                ],
//                result: [
//                    .initCapacity,
//                    .put,
//                    .put,
//                    .get(value: 1),
//                    .put,
//                    .get(value: -1),
//                    .put,
//                    .get(value: -1),
//                    .get(value: 3),
//                    .get(value: 4)
//                ],
//                func1: self.run
//            )
        ]
    }
}

//[LeetCodeSandbox.LRUCache.Solution.Result.initCapacity, LeetCodeSandbox.LRUCache.Solution.Result.put, LeetCodeSandbox.LRUCache.Solution.Result.put, LeetCodeSandbox.LRUCache.Solution.Result.get(value: 1), LeetCodeSandbox.LRUCache.Solution.Result.put, LeetCodeSandbox.LRUCache.Solution.Result.get(value: 2), LeetCodeSandbox.LRUCache.Solution.Result.put, LeetCodeSandbox.LRUCache.Solution.Result.get(value: 1), LeetCodeSandbox.LRUCache.Solution.Result.get(value: 3), LeetCodeSandbox.LRUCache.Solution.Result.get(value: 4)],
//[LeetCodeSandbox.LRUCache.Solution.Result.initCapacity, LeetCodeSandbox.LRUCache.Solution.Result.put, LeetCodeSandbox.LRUCache.Solution.Result.put, LeetCodeSandbox.LRUCache.Solution.Result.get(value: 1), LeetCodeSandbox.LRUCache.Solution.Result.put, LeetCodeSandbox.LRUCache.Solution.Result.get(value: -1), LeetCodeSandbox.LRUCache.Solution.Result.put, LeetCodeSandbox.LRUCache.Solution.Result.get(value: -1), LeetCodeSandbox.LRUCache.Solution.Result.get(value: 3), LeetCodeSandbox.LRUCache.Solution.Result.get(value: 4)]
