//
//  剑指 Offer 47. 礼物的最大价值2刷.swift
//  LCode
//
//  Created by Z on 2021/3/24.
//

class Solution_47_2 {
    //  每一个点的最大值 当前值 + max(左 or 上)
    // 时间复杂度O(n) n 为总个数
    // 空间复杂度O(1)
    func maxValue(_ grid: [[Int]]) -> Int {
        var grid = grid
        for i in 0 ..< grid.count {
            for k in 0 ..< grid[i].count {
                // 第一横排
                if i == 0, k > 0 {
                    grid[i][k] += grid[i][k - 1]
                }
                // 第一竖列
                if k == 0, i > 0 {
                    grid[i][k] += grid[i - 1][k]
                }
                if i > 0, k > 0 {
                    let leftValue = grid[i][k - 1]
                    let topValue = grid[i - 1][k]
                    grid[i][k] += max(leftValue, topValue)
                }
            }
        }
        return grid.last!.last!
    }
}
