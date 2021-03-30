//
//  674. 最长连续递增序列.swift
//  LCode
//
//  Created by Z on 2021/3/30.
//

class Solution_674 {
    // 时间复杂度O(n)
    // 空间复杂度O(1)
    func findLengthOfLCIS(_ nums: [Int]) -> Int {
        if nums.count < 2 {
            return nums.count
        }
        var ans = 0
        var count = 1

        for i in 1 ..< nums.count {
            if nums[i - 1] < nums[i] {
                count += 1
            } else {
                count = 1
            }
            ans = max(ans, count)
        }
        return ans
    }
}
