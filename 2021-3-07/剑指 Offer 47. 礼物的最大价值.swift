//
//  剑指 Offer 47. 礼物的最大价值.swift
//  LCode
//
//  Created by Z on 2021/3/7.
//

class Solution_47 {
    // https://leetcode-cn.com/problems/li-wu-de-zui-da-jie-zhi-lcof/solution/c-dong-tai-gui-hua-tu-wen-xiang-jie-by-s-3vou/

    // 时间复杂度O(ab) a b 分别为grid.count grid[0].count
    // 空间复杂度O(1)

    // 关键点 f(a,b) = max(f(a,b-1),f(a-1,b)) + f(a,b)  同时更新自己

    func maxValue(_ grid: [[Int]]) -> Int {
        var grid = grid

        let count1 = grid.count
        let count2 = grid.first!.count

        for a in 0 ..< count1 {
            for b in 0 ..< count2 {
                if a == 0, b == 0 {
                    continue
                } else if a == 0 {
                    let p = grid[a][b - 1] + grid[a][b]
                    grid[a][b] = p
                } else if b == 0 {
                    let p = grid[a - 1][b] + grid[a][b]
                    grid[a][b] = p
                } else {
                    let left = grid[a][b - 1]
                    let top = grid[a - 1][b]
                    let p = max(left, top) + grid[a][b]
                    grid[a][b] = p
                }
            }
        }
        return grid[count1 - 1][count2 - 1]
    }
}
