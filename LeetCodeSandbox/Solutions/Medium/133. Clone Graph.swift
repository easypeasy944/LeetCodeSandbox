//
//  133. Clone Graph.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 15.01.2023.
//

import Foundation

enum CloneGraph {
    
    class Solution {
        
        struct Pair: Hashable {
            let value1: Int
            let value2: Int
        }
        
        public class Node: Equatable {
            public var val: Int
            public var neighbors: [Node?]
            public init(_ val: Int) {
                self.val = val
                self.neighbors = []
            }
            
            public static func == (lhs: CloneGraph.Solution.Node, rhs: CloneGraph.Solution.Node) -> Bool {
                lhs.val == rhs.val && lhs.neighbors == rhs.neighbors
            }
        }
        
        func cloneGraph(_ node: Node?) -> Node? {
            guard let node = node else { return nil }
            
            var nodes: [Node] = []
            nodes.reserveCapacity(100)
            
            for i in 1...100 {
                nodes.append(Node(i))
            }
            var visited = Set<Int>([node.val])
            dfs(rootNode: node, visited: &visited, result: &nodes)
            return nodes[0]
        }
        
        func dfs(rootNode: Node, visited: inout Set<Int>, result: inout [Node]) {
            for neighbor in rootNode.neighbors {
                if let neighbor = neighbor {
                    result[rootNode.val - 1].neighbors.append(result[neighbor.val - 1])
                }
            }
            
            visited.insert(rootNode.val)
            
            for neighbor in rootNode.neighbors {
                if let neighbor = neighbor, !visited.contains(neighbor.val) {
                    dfs(rootNode: neighbor, visited: &visited, result: &result)
                }
            }
        }
    }
}

extension CloneGraph.Solution: SolutionProtocol {
        
    func _dfs(rootNode: Node?, visited: inout Set<Int>, result: inout Set<Pair>) {
        guard let rootNode = rootNode else { return }
        
        for neighbor in rootNode.neighbors {
            if let neighbor = neighbor, !visited.contains(neighbor.val) {
                let minValue = min(rootNode.val, neighbor.val)
                let maxValue = max(rootNode.val, neighbor.val)
        
                visited.insert(rootNode.val)
                result.insert(Pair(value1: minValue, value2: maxValue))
                
                _dfs(rootNode: neighbor, visited: &visited, result: &result)
            }
        }
    }
    
    var testCases: [Validatable] {
        // Case 1
        
        let node1 = Node(1)
        let node2 = Node(2)
        let node3 = Node(3)
        let node4 = Node(4)
        
        node1.neighbors = [node2, node4]
        node2.neighbors = [node1, node3]
        node3.neighbors = [node2, node4]
        node4.neighbors = [node1, node3]
        
        let _node1 = Node(1)
        let _node2 = Node(2)
        let _node3 = Node(3)
        let _node4 = Node(4)
        
        _node1.neighbors = [_node2, _node4]
        _node2.neighbors = [_node1, _node3]
        _node3.neighbors = [_node2, _node4]
        _node4.neighbors = [_node1, _node3]
        
        let comparator: (Node?, Node?) -> Bool = { lhs, rhs in
            var result1 = Set<Pair>()
            var visited1 = Set<Int>()
            
            var result2 = Set<Pair>()
            var visited2 = Set<Int>()
            
            self._dfs(rootNode: lhs, visited: &visited1, result: &result1)
            self._dfs(rootNode: rhs, visited: &visited2, result: &result2)
            
            return result1 == result2
        }
        
        return [
            TestCase1(input1: node1, result: _node1, func1: self.cloneGraph, comparator: comparator)
        ]
    }
}
