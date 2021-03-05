//
//  121. 买卖股票的最佳时机.swift
//  LCode
//
//  Created by Z on 2021/3/5.
//

class Solution121 {
    // https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock/
    // 时间复杂度O(n)
    // 空间复杂度O(1)
    func maxProfit(_ prices: [Int]) -> Int {
        var buy = Int.max
        var m: Int = 0

        for p in prices {
            buy = min(buy, p)
            m = max(p - buy, m)
        }

        return m
    }
}
