//
//  692. Top K Frequent Words.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 24.01.2023.
//

import Foundation

enum TopKFrequentWords {
    
    class Solution {
        func topKFrequent(_ words: [String], _ k: Int) -> [String] {
            let map: [String: Int] = words.reduce(into: [:], { $0[$1, default: 0] += 1 })
            var maxHeap = MaxHeap(size: k)
            map.forEach { (key, value) in
                maxHeap.add(TopKFrequentWords.Item(word: key, count: value))
            }
            
            var result: [String] = []
            for _ in 0..<k {
                result.append(maxHeap.pop()!.word)
            }
            
            return result
        }
    }
    
    struct Item: Comparable {
        static func < (lhs: TopKFrequentWords.Item, rhs: TopKFrequentWords.Item) -> Bool {
            if lhs.count == rhs.count {
                return lhs.word > rhs.word
            } else if lhs.count < rhs.count {
                return true
            } else {
                return false
            }
        }
        
        let word: String
        let count: Int
        
        init(word: String, count: Int) {
            self.word = word
            self.count = count
        }
        
        init() {
            self.word = ""
            self.count = .min
        }
    }
    
    struct MaxHeap {
        var array: [Item]
        let size: Int
        var count: Int = 0
        
        init(size: Int) {
            array = Array(repeating: Item(), count: size)
            self.size = size
        }
        
        mutating func shiftUp(i: Int) {
            var child = i
            var parent = self.parent(i: i)
            
            while child != parent && array[child] > array[parent] {
                array.swapAt(parent, child)
                child = parent
                parent = self.parent(i: child)
            }
        }
        
        mutating func shiftDown(i: Int) {
            let leftChild = 2 * i + 1
            let rightChild = 2 * i + 2
            
            var index = i
            
            if rightChild < count && array[rightChild] > array[index] {
                index = rightChild
            }
            if leftChild < count && array[leftChild] > array[index] {
                index = leftChild
            }
            
            if index != i {
                array.swapAt(i, index)
                
                shiftDown(i: index)
            }
        }
        
        mutating func add(_ item: Item) {
            if count == size {
                var index = 0
                for i in 0..<size {
                    if array[i] < array[index] {
                        index = i
                    }
                }
                
                if item > array[index] {
                    array[index] = item
                    shiftUp(i: index)
                }
            } else {
                array[count] = item
                shiftUp(i: count)
                count += 1
            }
        }
        
        mutating func pop() -> Item? {
            let value = array.first
            array[0] = array[count - 1]
            count -= 1
            
            shiftDown(i: 0)
            
            return value
        }
        
        func parent(i: Int) -> Int {
            (i - 1) / 2
        }
        
    }
}

extension TopKFrequentWords.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
//            TestCase2(input1: ["the","day","is","sunny","the","the","the","sunny","is","is"], input2: 4, result: ["the","is","sunny","day"], func2: self.topKFrequent),
//            TestCase2(input1: ["i","love","leetcode","i","love","coding"], input2: 2, result: ["i","love"], func2: self.topKFrequent),
//            TestCase2(input1: ["a","aa","aaa","aaaa"], input2: 2, result: ["a","aa"], func2: self.topKFrequent),
            TestCase2(input1: ["plpaboutit","jnoqzdute","sfvkdqf","mjc","nkpllqzjzp","foqqenbey","ssnanizsav","nkpllqzjzp","sfvkdqf","isnjmy","pnqsz","hhqpvvt","fvvdtpnzx","jkqonvenhx","cyxwlef","hhqpvvt","fvvdtpnzx","plpaboutit","sfvkdqf","mjc","fvvdtpnzx","bwumsj","foqqenbey","isnjmy","nkpllqzjzp","hhqpvvt","foqqenbey","fvvdtpnzx","bwumsj","hhqpvvt","fvvdtpnzx","jkqonvenhx","jnoqzdute","foqqenbey","jnoqzdute","foqqenbey","hhqpvvt","ssnanizsav","mjc","foqqenbey","bwumsj","ssnanizsav","fvvdtpnzx","nkpllqzjzp","jkqonvenhx","hhqpvvt","mjc","isnjmy","bwumsj","pnqsz","hhqpvvt","nkpllqzjzp","jnoqzdute","pnqsz","nkpllqzjzp","jnoqzdute","foqqenbey","nkpllqzjzp","hhqpvvt","fvvdtpnzx","plpaboutit","jnoqzdute","sfvkdqf","fvvdtpnzx","jkqonvenhx","jnoqzdute","nkpllqzjzp","jnoqzdute","fvvdtpnzx","jkqonvenhx","hhqpvvt","isnjmy","jkqonvenhx","ssnanizsav","jnoqzdute","jkqonvenhx","fvvdtpnzx","hhqpvvt","bwumsj","nkpllqzjzp","bwumsj","jkqonvenhx","jnoqzdute","pnqsz","foqqenbey","sfvkdqf","sfvkdqf"], input2: 1, result: ["fvvdtpnzx"], func2: self.topKFrequent),
        ]
    }
}
