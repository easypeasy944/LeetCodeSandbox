//
//  Quick sort.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 05.01.2023.
//

import Foundation

extension Array where Element: Equatable & Comparable  {
    
    mutating func qsort() {
        qsort(l: 0, r: count - 1)
    }
    
    private mutating func qsort(l: Int, r: Int) {
        if l < r {
            let index = partition(l: l, r: r)
            qsort(l: l, r: index - 1)
            qsort(l: index + 1, r: r)
        }
    }
    
    private mutating func partition(l: Int, r: Int) -> Int {
        var i = l - 1
        let pivot = self[r]
        
        for index in l..<r {
            if self[index] < pivot {
                i += 1
                swapAt(index, i)
            }
        }
        swapAt(i + 1, r)
        return (i + 1)
    }
}
