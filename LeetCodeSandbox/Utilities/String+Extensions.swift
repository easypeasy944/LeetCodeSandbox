//
//  String+Extensions.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 22.08.2022.
//

import Foundation

extension String {
    
    subscript(_ index: Int) -> String? {
        guard 0..<count ~= index else { return nil }
        let index = self.index(startIndex, offsetBy: index)
        return String(self[index])
    }
}
