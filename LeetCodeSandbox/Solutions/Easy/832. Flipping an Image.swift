//
//  832. Flipping an Image.swift
//  LeetCodeSandbox
//
//  Created by Aynur Galiev on 07.02.2023.
//

import Foundation

enum FlippingAnImage {
    
    class Solution {
        func flipAndInvertImage(_ image: [[Int]]) -> [[Int]] {
            var flippedImage = image
            
            for i in 0..<flippedImage.count {
                for j in 0..<(flippedImage[i].count / 2) {
                    let temp = flippedImage[i][j]
                    flippedImage[i][j] = flippedImage[i][flippedImage[i].count - j - 1] == 0 ? 1 : 0
                    flippedImage[i][image[i].count - j - 1] = temp == 0 ? 1 : 0
                }
                
                if flippedImage[i].count % 2 == 1 {
                    flippedImage[i][flippedImage[i].count / 2] = flippedImage[i][flippedImage[i].count / 2] == 0 ? 1 : 0
                }
            }
            
            return flippedImage
        }
    }
}

extension FlippingAnImage.Solution: SolutionProtocol {
        
    var testCases: [Validatable] {
        return [
            TestCase1(
                input1: [[1,1,0,0],[1,0,0,1],[0,1,1,1],[1,0,1,0]],
                result: [[1,1,0,0],[0,1,1,0],[0,0,0,1],[1,0,1,0]],
                func1: self.flipAndInvertImage
            ),
            TestCase1(
                input1: [[1,1,0],[1,0,1],[0,0,0]],
                result: [[1,0,0],[0,1,0],[1,1,1]],
                func1: self.flipAndInvertImage
            ),
        ]
    }
}
