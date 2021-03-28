//
//  33. 搜索旋转排序数组.swift
//  LCode
//
//  Created by Z on 2021/3/28.
//

class Solution33 {
    // 时间复杂度O(logn)
    // 空间复杂度O(1)
    func search(_ nums: [Int], _ target: Int) -> Int {
        var leftIndex = 0
        var rightIndex = nums.count - 1
        
        while leftIndex <= rightIndex {
            let midIndex = (rightIndex - leftIndex) / 2 + leftIndex
            if nums[midIndex] == target {
                return midIndex
            }
            let leftVal = nums[leftIndex]
            let rightVal = nums[rightIndex]
            let midVal = nums[midIndex]
            
            if midVal < rightVal {
                if target > midVal, target <= rightVal {
                    leftIndex = midIndex + 1
                } else {
                    rightIndex = midIndex - 1
                }
            } else {
                if target < midVal, target >= leftVal {
                    rightIndex = midIndex - 1
                } else {
                    leftIndex = midIndex + 1
                }
            }
        }
        
        return -1
    }
}
