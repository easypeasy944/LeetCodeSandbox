//
//  TestCase.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 20.08.2022.
//

import Foundation

struct TestCase0<Result> {
    let result: Result
}

struct TestCase1<Input1, Result> {
    let input1: Input1
    let result: Result
}

struct TestCase2<Input1, Input2, Result> {
    let input1: Input1
    let input2: Input2
    let result: Result
}
