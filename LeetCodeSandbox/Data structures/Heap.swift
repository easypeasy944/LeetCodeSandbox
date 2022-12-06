//
//  Heap.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 06.12.2022.
//

import Foundation

struct Heap<T: Comparable> {
    enum Kind { case max, min }
    
    private let kind: Kind
    private var array: [T] = []
    
    init(kind: Kind) {
        self.kind = kind
    }
    
    mutating func insert(_ newElement: T) {
        if array.isEmpty {
            array.append(newElement)
            return
        } else {
            array.append(newElement)
            shiftUp(index: array.count - 1)
        }
    }
    
    private func compare(_ lhsValue: T, _ rhsValue: T) -> Bool {
        if kind == .max {
            return lhsValue > rhsValue
        } else {
            return lhsValue < rhsValue
        }
    }
    
    private func parent(for index: Int) -> Int {
        (index - 1) / 2
    }
    
    private mutating func shiftUp(index: Int) {
        var childIndex = index
        let child = array[childIndex]
        var parentIndex = self.parent(for: childIndex)
        
        while childIndex > 0 && compare(child, array[parentIndex]) {
            array[childIndex] = array[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parent(for: childIndex)
        }
        
        array[childIndex] = child
    }
    
    private mutating func shiftDown(index: Int) {
        guard 0..<array.count ~= index else { return }
        
        var minIndex = index
        let leftIndex = 2 * index + 1
        let rightIndex = 2 * index + 2
        
        if leftIndex < array.count && compare(array[leftIndex], array[minIndex]) {
            minIndex = leftIndex
        }
        if rightIndex < array.count && compare(array[rightIndex], array[minIndex]) {
            minIndex = rightIndex
        }
        
        if minIndex != index {
            swap(index, minIndex)
            
            shiftDown(index: minIndex)
        }
    }
    
    mutating func delete(index: Int) -> T? {
        guard 0..<array.count ~= index else { return nil }
        
        let value = array[index]
        array[index] = array[array.count - 1]
        array.removeLast()
        
        shiftDown(index: index)
        
        return value
    }
    
    private mutating func swap(_ index1: Int, _ index2: Int) {
        let temp = array[index1]
        array[index1] = array[index2]
        array[index2] = temp
    }
}
