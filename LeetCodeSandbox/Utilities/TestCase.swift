//
//  TestCase.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 20.08.2022.
//

import Foundation

protocol TestCase: Validatable {
    associatedtype Result: Equatable
    
    var result: Result { get }
    var `func`: () -> Result { get }
    var comparator: (Result, Result) -> Bool { get }
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
        
        let isSuccess = self.comparator(result, self.result)
        
        print("[\(value) ms][\(isSuccess ? "SUCCESS" : "FAILURE")]: Expected - \(self.result), actual - \(result)")
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

struct TestCase0<Result: Equatable>: TestCase {
    let result: Result
    let func0: () -> Result
    let comparator: (Result, Result) -> Bool
    
    init(
        result: Result,
        func0: @escaping () -> Result,
        comparator: @escaping (Result, Result) -> Bool = { result1, result2 in result1 == result2 }
    ) {
        self.result = result
        self.func0 = func0
        self.comparator = comparator
    }
    
    var `func`: () -> Result {
        { self.func0() }
    }
}

struct TestCase1<Input1, Result: Equatable>: TestCase {
    let input1: Input1
    let result: Result
    let func1: (Input1) -> Result
    let comparator: (Result, Result) -> Bool
    
    init(
        input1: Input1,
        result: Result,
        func1: @escaping (Input1) -> Result,
        comparator: @escaping (Result, Result) -> Bool = { result1, result2 in result1 == result2 }
    ) {
        self.input1 = input1
        self.result = result
        self.func1 = func1
        self.comparator = comparator
    }
    
    var `func`: () -> Result {
        { self.func1(self.input1) }
    }
}

struct TestCase2<Input1, Input2, Result: Equatable>: TestCase {
    let input1: Input1
    let input2: Input2
    let result: Result
    let func2: (Input1, Input2) -> Result
    let comparator: (Result, Result) -> Bool
    
    init(
        input1: Input1,
        input2: Input2,
        result: Result,
        func2: @escaping (Input1, Input2) -> Result,
        comparator: @escaping (Result, Result) -> Bool = { result1, result2 in result1 == result2 }
    ) {
        self.input1 = input1
        self.input2 = input2
        self.result = result
        self.func2 = func2
        self.comparator = comparator
    }
    
    var `func`: () -> Result {
        { self.func2(self.input1, self.input2) }
    }
}

struct TestCase3<Input1, Input2, Input3, Result: Equatable>: TestCase {
    let input1: Input1
    let input2: Input2
    let input3: Input3
    let result: Result
    let func3: (Input1, Input2, Input3) -> Result
    let comparator: (Result, Result) -> Bool
    
    init(
        input1: Input1,
        input2: Input2,
        input3: Input3,
        result: Result,
        func3: @escaping (Input1, Input2, Input3) -> Result,
        comparator: @escaping (Result, Result) -> Bool = { result1, result2 in result1 == result2 }
    ) {
        self.input1 = input1
        self.input2 = input2
        self.input3 = input3
        self.result = result
        self.func3 = func3
        self.comparator = comparator
    }
    
    var `func`: () -> Result {
        { self.func3(self.input1, self.input2, self.input3) }
    }
}

struct TestCase4<Input1, Input2, Input3, Input4, Result: Equatable>: TestCase {
    let input1: Input1
    let input2: Input2
    let input3: Input3
    let input4: Input4
    let result: Result
    let func4: (Input1, Input2, Input3, Input4) -> Result
    let comparator: (Result, Result) -> Bool
    
    init(
        input1: Input1,
        input2: Input2,
        input3: Input3,
        input4: Input4,
        result: Result,
        func4: @escaping (Input1, Input2, Input3, Input4) -> Result,
        comparator: @escaping (Result, Result) -> Bool = { result1, result2 in result1 == result2 }
    ) {
        self.input1 = input1
        self.input2 = input2
        self.input3 = input3
        self.input4 = input4
        self.result = result
        self.func4 = func4
        self.comparator = comparator
    }
    
    var `func`: () -> Result {
        { self.func4(self.input1, self.input2, self.input3, self.input4) }
    }
}

struct Result1<T1: Equatable>: Equatable {
    let value1: T1
}

struct Result2<T1: Equatable, T2: Equatable>: Equatable {
    let value1: T1
    let value2: T2
}

struct Result3<T1: Equatable, T2: Equatable, T3: Equatable>: Equatable {
    let value1: T1
    let value2: T2
    let value3: T3
}

