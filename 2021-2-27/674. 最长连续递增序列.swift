//
//  674. 最长连续递增序列.swift
//  LCode
//
//  Created by Z on 2021/2/27.
//

class Solution674 {
    // https://leetcode-cn.com/problems/longest-continuous-increasing-subsequence/
    // 时间复杂度 O(n) n 为数组长度
    // 空间复杂度 O(1) 使用额外空间为常数2
    func findLengthOfLCIS(_ nums: [Int]) -> Int {
        if nums.count < 2 {
            return nums.count
        }
        var ans = 0
        var start = 0
        for i in 1 ..< nums.count {
            if nums[i] > nums[i - 1] {
                ans = max(ans, i - start)
            } else {
                start = i
            }
        }

        return ans + 1
    }
}
