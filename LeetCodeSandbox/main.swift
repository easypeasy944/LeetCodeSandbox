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
//        LetterCombinationsOfAPhoneNumber.Solution(),
//        RomanToInteger.Solution(),
//        ZigzagConversion.Solution(),
//        ThreeSum.Solution(),
//        Permutations.Solution(),
//        CombinationSum.Solution(),
//        RemoveElement.Solution(),
//        ImplementStrStr.Solution(),
//        GroupAnagrams.Solution(),
//        FirstMissingPositive.Solution(),
//        ClimbingStairs.Solution(),
//        SearchA2DMatrix.Solution(),
//        AddBinary.Solution(),
//        SameTree.Solution(),
//        PathSumII.Solution(),
//        PopulatingNextRightPointersInEachNodeII.Solution(),
//        ConvertSortedListToBinarySearchTree.Solution(),
//        CountCompleteTreeNodes.Solution(),
//        VerifyPreorderSerializationOfABinaryTree.Solution(),
//        BinaryTreeMaximumPathSum.Solution(),
//        Triangle.Solution(),
//        SortColors.Solution(),
//        ContainerWithMostWater.Solution(),
//        TrappingRainWater.Solution(),
//        ProductOfArrayExceptSelf.Solution(),
//        MergeSortedArray.Solution(),
//        FindMinimumInRotatedSortedArray.Solution(),
//        MinimumSizeSubarraySum.Solution(),
//        GameOfLife.Solution(),
//        WordPattern.Solution(),
//        MaximumProductOfWordLengths.Solution(),
//        DiagonalTraverse.Solution(),
//        TopKFrequentElements.Solution(),
//        PacificAtlanticWaterFlow.Solution(),
//        FindRightInterval.Solution(),
//        SwapNodesInPairs.Solution(),
//        JumpGameII.Solution(),
//        FindPeakElement.Solution(),
//        LargestNumber.Solution(),
//        RansomNote.Solution(),
//        FindTheDifference.Solution(),
//        RemoveDuplicatesFromSortedArray.Solution(),
//        FindMedianFromDataStream.Solution(),
//        SlidingWindowMedian.Solution(),
//        MagicalString.Solution(),
//        ReverseWordsInAStringIII.Solution(),
//        SubarraySumEqualsK.Solution(),
//        Combinations.Solution(),
//        PascalTriangle.Solution(),
//        ReverseInteger.Solution(),
//        PlusOne.Solution(),
//        LowestCommonAncestorOfABinaryTree.Solution(),
//        RotateArray.Solution(),
//        CompareVersionNumbers.Solution(),
//        MoveZeroes.Solution(),
//        PerfectSquares.Solution(),
//        LongestIncreasingSubsequence.Solution(),
//        ReverseString.Solution(),
//        SearchInRotatedSortedArray.Solution(),
//        PeekingIterator.Solution(),
//        NthDigit.Solution(),
//        ConstructQuadTree.Solution(),
//        MakeArrayZeroBySubtractingEqualAmounts.Solution(),
//        ArrayWithElementsNotEqualToAverageOfNeighbors.Solution(),
//        AssignCookies.Solution(),
//        SingleNumber.Solution(),
//        IntersectionOfTwoArrays.Solution(),
//        MinimumPathSum.Solution(),
//        MaxAreaOfIsland.Solution(),
//        ReorderList.Solution(),
//        FirstUniqueCharacterInAString.Solution(),
//        SortCharactersByFrequency.Solution(),
//        SortCharactersByFrequency.Solution(),
//        MaximumNumberOfPairsInArray.Solution(),
//        NQueens.Solution(),
//        GridIllumination.Solution(),
//        LRUCache.Solution(),
//        WordBreak.Solution(),
//        LongestConsecutiveSequence.Solution(),
//        HappyNumber.Solution(),
//        SpiralMatrix.Solution(),
//        CountPrimes.Solution(),
//        RangeSumQuery_Immutable.Solution(),
//        BestTimeToBuyAndSellStock.Solution(),
//        BuildArrayFromPermutation.Solution(),
//        TruncateSentence.Solution(),
//        MajorityElementII.Solution(),
//        FindTheDuplicateNumber.Solution(),
//        JumpGame.Solution(),
//        CombinationSumIII.Solution(),
//        SuperWashingMachines.Solution(),
//        AppendKIntegersWithMinimalSum.Solution(),
//        CloneGraph.Solution(),
//        EvaluateDivision.Solution(),
//        IsGraphBipartite.Solution(),
//        ContiguousArray.Solution(),
//        MinStack.Solution(),
//        NextGreaterElementI.Solution(),
//        DailyTemperatures.Solution(),
//        PartitionList.Solution(),
//        RemoveNthNodeFromEndOfList.Solution(),
        FindTheMinimumAndMaximumNumberOfNodesBetweenCriticalPoints.Solution()
    ]
).run()
