//
//  main.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 20.08.2022.
//

import Foundation

protocol Runnable {
    static func run()
}

struct Runner {
    let runnables: [Runnable.Type]
    
    func run() {
        for runnable in runnables {
            print("==== Running \(String(describing: runnable))...")
            runnable.run()
            print("====", terminator: "\n")
        }
    }
}

Runner(
    runnables: [
        ZigzagConversion.self
    ]
).run()

