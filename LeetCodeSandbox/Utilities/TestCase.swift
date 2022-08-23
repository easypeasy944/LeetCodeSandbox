//
//  TestCase.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 20.08.2022.
//

import Foundation

protocol TestCase: Validatable {
    associatedtype Result: Equatable
    associatedtype ComparableResult: Equatable
    
    var result: Result { get }
    var `func`: () -> Result { get }
    var comparator: (Result) -> ComparableResult { get }
}

protocol Validatable {
    func validate()
}

extension TestCase {
    func validate() {
        let startTime = clock()
        let result = self.func()
        let endTime = clock()
        let milliseconds = (Double(endTime - startTime) / Double(CLOCKS_PER_SEC)) * 1000
        
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.decimalSeparator = "."
        let value = numberFormatter.string(from: milliseconds as NSNumber)!
        
        let actualResult = self.comparator(result)
        let expectedResult = self.comparator(self.result)
        
        print("[\(value) ms][\(expectedResult == actualResult ? "SUCCESS" : "FAILURE")]: Expected - \(expectedResult), actual - \(actualResult)")
    }
}

struct Measure {
    
    enum Time {
        case milliseconds
        case seconds
    }
    
    static func run(_ closure: () -> Void, time: Time = .milliseconds) -> Int {
        let startTime = clock()
        closure()
        let endTime = clock()
        let elapsedTimeInSeconds = Double(endTime - startTime) / Double(CLOCKS_PER_SEC)
        
        switch time {
            case .milliseconds: return Int(elapsedTimeInSeconds * 1000)
            case .seconds: return Int(elapsedTimeInSeconds)
        }
    }
}

struct TestCase0<Result: Equatable, ComparableResult: Equatable>: TestCase {
    let result: Result
    let func0: () -> Result
    let comparator: (Result) -> ComparableResult
    
    var `func`: () -> Result {
        { self.func0() }
    }
}

extension TestCase0 where Result == ComparableResult {
    init(result: Result, func0: @escaping () -> Result) {
        self.init(result: result, func0: func0, comparator: { result in result })
    }
}

struct TestCase1<Input1, Result: Equatable, ComparableResult: Equatable>: TestCase {
    let input1: Input1
    let result: Result
    let func1: (Input1) -> Result
    let comparator: (Result) -> ComparableResult
    
    var `func`: () -> Result {
        { self.func1(self.input1) }
    }
}

extension TestCase1 where Result == ComparableResult {
    init(input1: Input1, result: Result, func1: @escaping (Input1) -> Result) {
        self.init(input1: input1, result: result, func1: func1, comparator: { result in result })
    }
}

struct TestCase2<Input1, Input2, Result: Equatable, ComparableResult: Equatable>: TestCase {
    let input1: Input1
    let input2: Input2
    let result: Result
    let func2: (Input1, Input2) -> Result
    let comparator: (Result) -> ComparableResult
    
    var `func`: () -> Result {
        { self.func2(self.input1, self.input2) }
    }
}

extension TestCase2 where Result == ComparableResult {
    init(input1: Input1, input2: Input2, result: Result, func2: @escaping (Input1, Input2) -> Result) {
        self.init(input1: input1, input2: input2, result: result, func2: func2, comparator: { result in result })
    }
}
