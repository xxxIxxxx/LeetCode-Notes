//
//  714. 买卖股票的最佳时机含手续费.swift
//  LCode
//
//  Created by Z on 2021/3/27.
//

class Solution714 {
    // 时间复杂度O(n)
    // 空间复杂度O(1)
    // 贪心算法
    // buy = 价格加上手续费，p = 当前价格
    // 后序出现更低的 buy，则更新买入价 buy
    // 出现 p > buy 那么先卖出，并累计收益 ans += p - buy 但是后续还有可能出现更高的 p，
    // 那么使 buy = p，这个时候不加手续费是 因为我们假设先卖出获利了手续费已经扣掉，
    // 当遇到更高的 p 时 我们只需要累积 p 和 buy的差价到收益中。
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        var buy = Int.max
        var ans = 0
        for p in prices {
            if p + fee < buy {
                buy = p + fee
            } else if p > buy {
                ans += p - buy
                buy = p
            }
        }

        return ans
    }
}

