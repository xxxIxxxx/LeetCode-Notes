//
//  714. 买卖股票的最佳时机含手续费.swift
//  LCode
//
//  Created by Z on 2021/4/10.
//

class Solution_714_ {
    // 时间复杂度O(n)
    // 空间复杂度O(1)
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        var ans = 0
        var minP = Int.max
        for p in prices {
            if p + fee < minP {
                minP = p + fee
            } else if p > minP {
                ans += p - minP
                minP = p
            }
        }
        return ans
    }
}
