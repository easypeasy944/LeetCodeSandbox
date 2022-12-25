//
//  427. Construct Quad Tree.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 25.12.2022.
//

import Foundation

enum ConstructQuadTree {
    
    class Solution {
        
        public class Node: Equatable {
            public static func == (lhs: ConstructQuadTree.Solution.Node, rhs: ConstructQuadTree.Solution.Node) -> Bool {
                lhs.val == rhs.val &&
                lhs.isLeaf == rhs.isLeaf &&
                lhs.topLeft == rhs.topLeft &&
                lhs.topRight == rhs.topRight &&
                lhs.bottomLeft == rhs.bottomLeft &&
                lhs.bottomRight == rhs.bottomRight
            }
            
            public var val: Bool
            public var isLeaf: Bool
            public var topLeft: Node?
            public var topRight: Node?
            public var bottomLeft: Node?
            public var bottomRight: Node?
            public init(_ val: Bool, _ isLeaf: Bool) {
                self.val = val
                self.isLeaf = isLeaf
                self.topLeft = nil
                self.topRight = nil
                self.bottomLeft = nil
                self.bottomRight = nil
            }
        }
        
        func construct(_ grid: [[Int]]) -> Node? {
            let root = buildNode(startX: 0, startY: 0, size: grid.count, grid: grid)
            return root
        }
        
        func buildNode(
            startX: Int,
            startY: Int,
            size: Int,
            grid: [[Int]]
        ) -> Node {
            if size == 1 {
                return Node(grid[startY][startX] == 1, true)
            } else {
                let startValue = grid[startY][startX]
                
                var isSolid: Bool = true
                for row in startY..<(startY + size) where isSolid {
                    for column in startX..<(startX + size) where isSolid {
                        if grid[row][column] != startValue {
                            isSolid = false
                            break
                        }
                    }
                }
                
                if isSolid {
                    return Node(startValue == 1, true)
                } else {
                    let newSize = size / 2
    
                    let newNode = Node(true, false)
                    newNode.topLeft = buildNode(startX: startX, startY: startY, size: newSize, grid: grid)
                    newNode.topRight = buildNode(startX: startX + newSize, startY: startY, size: newSize, grid: grid)
                    newNode.bottomLeft = buildNode(startX: startX, startY: startY + newSize, size: newSize, grid: grid)
                    newNode.bottomRight = buildNode(startX: startX + newSize, startY: startY + newSize, size: newSize, grid: grid)
                    return newNode
                }
            }
        }
    }
}

extension ConstructQuadTree.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: [[1,1,1,1,0,0,0,0],[1,1,1,1,0,0,0,0],[1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1],[1,1,1,1,0,0,0,0],[1,1,1,1,0,0,0,0],[1,1,1,1,0,0,0,0],[1,1,1,1,0,0,0,0]], result: Node(false, false), func1: self.construct)
        ]
    }
}
