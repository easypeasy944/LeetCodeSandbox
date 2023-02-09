//
//  306. Additive Number.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 09.02.2023.
//

import Foundation

enum AdditiveNumber {
    
    class Solution {
        func isAdditiveNumber(_ num: String) -> Bool {
            return _isAdditiveNumber(prev1: nil, prev2: nil, start: 0, end: num.count - 1, num: num, count: 0)
        }
        
        func _isAdditiveNumber(prev1: String?, prev2: String?, start: Int, end: Int, num: String, count: Int) -> Bool {
            if start > end {
                return count > 2
            }
            
            if prev1 == nil || prev2 == nil {
                for i in 1...(end - start + 1) {
                    let component = String(num[num.index(num.startIndex, offsetBy: start)..<num.index(num.startIndex, offsetBy: start + i)])
                    
                    if component.count > 1 && component.first == "0" || Int(component) == nil {
                        continue
                    }
                    
                    if prev1 == nil {
                        if _isAdditiveNumber(prev1: component, prev2: nil, start: start + i, end: end, num: num, count: count + 1) {
                            return true
                        }
                    } else {
                        if _isAdditiveNumber(prev1: prev1, prev2: component, start: start + i, end: end, num: num, count: count + 1) {
                            return true
                        }
                    }
                }
                
                return false
            } else {
                for i in 1...(end - start + 1) {
                    let component = String(num[num.index(num.startIndex, offsetBy: start)..<num.index(num.startIndex, offsetBy: start + i)])
                    
                    if component.count > 1 && component.first == "0" || Int(component) == nil {
                        continue
                    }
                    
                    if Int(prev1!)! + Int(prev2!)! == Int(component)! {
                        if _isAdditiveNumber(prev1: prev2, prev2: component, start: start + i, end: end, num: num, count: count + 1) {
                            return true
                        }
                    }
                }
                
                return false
            }
        }
    }
}

extension AdditiveNumber.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(input1: "1999999999999999910000000000000000", result: false, func1: self.isAdditiveNumber),
            TestCase1(input1: "11111111111011111111111", result: false, func1: self.isAdditiveNumber),
            TestCase1(input1: "1023", result: false, func1: self.isAdditiveNumber),
            TestCase1(input1: "0", result: false, func1: self.isAdditiveNumber),
            TestCase1(input1: "199100199", result: true, func1: self.isAdditiveNumber),
            TestCase1(input1: "112358", result: true, func1: self.isAdditiveNumber),
        ]
    }
}
