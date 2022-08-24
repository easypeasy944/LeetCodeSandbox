//
//  main.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 20.08.2022.
//

import Foundation

protocol SolutionProtocol {
    var testCases: [Validatable] { get }
}

struct Runner {
    let solutions: [SolutionProtocol]
    
    func run() {
        for solution in solutions {
            print("==== Running \(String(describing: solution))...")
            solution.testCases.forEach { $0.validate() }
            print("====", terminator: "\n")
        }
    }
}

Runner(
    solutions: [
        LetterCombinationsOfAPhoneNumber.Solution(),
        RomanToInteger.Solution(),
        ZigzagConversion.Solution(),
        ThreeSum.Solution(),
        Permutations.Solution(),
        CombinationSum.Solution()
    ]
).run()

