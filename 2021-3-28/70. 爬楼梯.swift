//
//  70. 爬楼梯.swift
//  LCode
//
//  Created by Z on 2021/3/28.
//

class Solution70 {
    // 时间复杂度O(n)
    // 空间复杂度O(1)
    func climbStairs(_ n: Int) -> Int {
        if n <= 2 {
            return n
        }
        var a = 1
        var b = 2
        var ans = 0
        for _ in 3 ... n {
            ans = a + b
            a = b
            b = ans
        }

        return ans
    }

    // 时间复杂度O(n)
    // 空间复杂度O(n)
    func climbStairs2(_ n: Int) -> Int {
        if n <= 2 {
            return n
        }

        var intMap: [Int: Int] = [:]
        intMap[1] = 1
        intMap[2] = 2
        var ans = 0
        for i in 3 ... n {
            let a = intMap[i-1] ?? 0
            let b = intMap[i-2] ?? 0
            ans = a + b
            intMap[i] = ans
        }

        return ans
    }
}
