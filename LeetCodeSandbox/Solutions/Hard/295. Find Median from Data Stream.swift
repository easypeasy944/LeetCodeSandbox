//
//  295. Find Median from Data Stream.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 17.12.2022.
//

import Foundation

enum FindMedianFromDataStream {
    
    class Solution {
        enum Action {
            case add(Int)
            case findMedian
        }
        
        func run(actions: [Action]) -> [Double?] {
            let finder = MedianFinder()
            var result: [Double?] = []
            
            actions.forEach {
                switch $0 {
                case .add(let value):
                    finder.addNum(value)
                    result.append(nil)
                    
                case .findMedian:
                    result.append(finder.findMedian())
                }
            }
            
            return result
        }
    }
    
    class MedianFinder {
        var array: [Int] = []
        
        init() { }
        
        func addNum(_ num: Int) {
            if array.isEmpty {
                array.append(num)
            } else {
                var l: Int = 0
                var r: Int = array.count - 1
                
                while l <= r {
                    let mid = l + (r - l) / 2
                    if array[mid] == num {
                        array.insert(num, at: mid)
                        return
                    } else if num < array[mid] {
                        r = mid - 1
                    } else {
                        l = mid + 1
                    }
                }
                
                array.insert(num, at: l)
            }
        }
        
        func findMedian() -> Double {
            let midLeftIndex = Int(floor(Float(array.count + 1) / 2)) - 1
            let midRightIndex = Int(ceil(Float(array.count + 1) / 2)) - 1
            
            return Double(array[midLeftIndex] + array[midRightIndex]) / 2
        }
    }
}

extension FindMedianFromDataStream.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(
                input1: [
                    Action.add(6),
                    Action.findMedian,
                    Action.add(10),
                    Action.findMedian,
                    Action.add(2),
                    Action.findMedian,
                    Action.add(6),
                    Action.findMedian,
                    Action.add(5),
                    Action.findMedian,
                    Action.add(0),
                    Action.findMedian,
                    Action.add(6),
                    Action.findMedian,
                    Action.add(3),
                    Action.findMedian,
                    Action.add(1),
                    Action.findMedian,
                    Action.add(0),
                    Action.findMedian,
                    Action.add(0),
                    Action.findMedian,
                ],
                result: [
                    nil,
                    6,
                    nil,
                    8,
                    nil,
                    6,
                    nil,
                    6,
                    nil,
                    6,
                    nil,
                    5.5,
                    nil,
                    6,
                    nil,
                    5.5,
                    nil,
                    5,
                    nil,
                    4,
                    nil,
                    3
                ],
                func1: self.run
            ),
            TestCase1(
                input1: [
                    Action.add(1),
                    Action.add(2),
                    Action.findMedian,
                    Action.add(3),
                    Action.findMedian
                ],
                result: [
                    nil,
                    nil,
                    1.5,
                    nil,
                    2
                ],
                func1: self.run
            )
        ]
    }
}
