//
//  121. 买卖股票的最佳时机2刷.swift
//  LCode
//
//  Created by Z on 2021/3/21.
//

class Solution_121 {
    // 时间复杂度O(n)
    // 空间复杂度O(1)
    func maxProfit(_ prices: [Int]) -> Int {
        var minBuy = Int.max
        var maxM = 0
        for item in prices {
            minBuy = min(item, minBuy)
            maxM = max(item - minBuy, maxM)
        }
        return maxM
    }
}
