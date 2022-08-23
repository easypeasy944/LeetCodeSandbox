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
}

protocol Validatable {
    func validate()
}

extension TestCase {
    func validate() {
        let actualResult = self.func()
        print("[\(self.result == actualResult ? "SUCCESS" : "FAILURE")]: Expected - \(self.result), actual - \(actualResult)")
    }
}

struct TestCase0<Result: Equatable>: TestCase {
    let result: Result
    let func0: () -> Result
    
    var `func`: () -> Result {
        { self.func0() }
    }
}

struct TestCase1<Input1, Result: Equatable>: TestCase {
    let input1: Input1
    let result: Result
    let func1: (Input1) -> Result
    
    var `func`: () -> Result {
        { self.func1(self.input1) }
    }
}

struct TestCase2<Input1, Input2, Result: Equatable>: TestCase {
    let input1: Input1
    let input2: Input2
    let result: Result
    let func2: (Input1, Input2) -> Result
    
    var `func`: () -> Result {
        { self.func2(self.input1, self.input2) }
    }
}
