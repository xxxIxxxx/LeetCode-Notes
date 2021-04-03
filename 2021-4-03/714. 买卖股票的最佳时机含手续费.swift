//
//  714. 买卖股票的最佳时机含手续费.swift
//  LCode
//
//  Created by Z on 2021/4/3.
//

class Solution_714 {
    // 时间复杂度O(n)
    // 空间复杂度O(1)
    // 低价买入高价卖出， 但是高价可能不是最优高价。
    // 所以把当前的卖出价记为买入价，如果后边出现高价，继续卖出计算价格差累加盈利。更新买入价
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        var profit = 0
        var minP = Int.max

        for item in prices {
            if item + fee < minP {
                minP = item + fee
            } else if item > minP {
                profit += item - minP
                minP = item
            }
        }

        return profit
    }
}
