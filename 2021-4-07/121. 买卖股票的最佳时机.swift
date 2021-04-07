//
//  121. 买卖股票的最佳时机.swift
//  LCode
//
//  Created by Z on 2021/4/7.
//

class Solution_121_ {
    // 时间复杂度O(n)
    // 空间复杂度O(1)
    func maxProfit(_ prices: [Int]) -> Int {
        var ans = 0
        var minP = Int.max

        for item in prices {
            minP = min(minP, item)
            ans = max(item - minP, ans)
        }

        return ans
    }
}
