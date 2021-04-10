//
//  剑指 Offer 47. 礼物的最大价值.swift
//  LCode
//
//  Created by Z on 2021/4/9.
//

class Solution_47_ {
    // 时间复杂度O(n) n 是总个数
    // 空间复杂度O(1)
    func maxValue(_ grid: [[Int]]) -> Int {
        var grid = grid
        for i in 0 ..< grid.count {
            var list = grid[i]
            for k in 0 ..< list.count {
                if i == 0, k > 0 {
                    list[k] = list[k] + list[k - 1]
                }
                if k == 0, i > 0 {
                    list[0] = list[0] + grid[i - 1][0]
                }
                if k > 0, i > 0 {
                    list[k] = list[k] + max(list[k - 1], grid[i - 1][k])
                }
            }
            grid[i] = list
        }

        return grid.last!.last!
    }
}
