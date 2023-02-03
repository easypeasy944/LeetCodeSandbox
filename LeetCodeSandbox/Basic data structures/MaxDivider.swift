//
//  MaxDivider.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 03.02.2023.
//

import Foundation

func maxDivider(a: Int, b: Int) -> Int {
    var a = a
    var b = b
    
    while a != 0 && b != 0 {
        if a > b {
            a = a % b
        } else {
            b = b % a
        }
    }
    
    return a + b
}
