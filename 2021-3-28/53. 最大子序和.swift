//
//  53. 最大子序和.swift
//  LCode
//
//  Created by Z on 2021/3/28.
//

class Solution53 {
    // 时间复杂度O(n)
    // 空间复杂度O(1)
    func maxSubArray(_ nums: [Int]) -> Int {
        var ans = Int.min
        var sum = 0
        for item in nums {
            sum += item
            ans = max(ans, sum)
            if sum < 0 {
                // 小于0 对后边的数没有增益效果，所以置为0
                sum = 0
            }
        }

        return ans
    }
}
