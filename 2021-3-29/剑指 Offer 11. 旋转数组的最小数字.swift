//
//  剑指 Offer 11. 旋转数组的最小数字.swift
//  LCode
//
//  Created by Z on 2021/3/29.
//

class Solution_11 {
    func minArray(_ numbers: [Int]) -> Int {
        var leftIndex = 0
        var rightIndex = numbers.count - 1
        while leftIndex < rightIndex {
            let midIndex = (rightIndex - leftIndex) / 2 + leftIndex
            if numbers[midIndex] > numbers[rightIndex] {
                leftIndex = midIndex + 1
            } else if numbers[midIndex] < numbers[rightIndex] {
                rightIndex = midIndex
            } else {
                rightIndex -= 1
            }
        }
        return numbers[leftIndex]
    }
}
