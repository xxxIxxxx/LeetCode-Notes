//
//  81. 搜索旋转排序数组 II.swift
//  LCode
//
//  Created by Z on 2021/3/29.
//

class Solution81 {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = (right - left) / 2 + left
            
            if nums[mid] == target {
                return true
            }
            
            if nums[mid] < nums[right] {
                if target <= nums[right], target > nums[mid] {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
                
            } else if nums[mid] > nums[right] {
                if target >= nums[left], target < nums[mid] {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
                
            } else {
                right -= 1
            }
        }
        
        return false
    }
}
