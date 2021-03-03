//
//  264. 丑数 II.swift
//  LCode
//
//  Created by Z on 2021/3/3.
//

class Solution264 {
    // https://leetcode-cn.com/problems/ugly-number-ii/
    // 时间复杂度 O(n)
    // 空间复杂度 O(n)
    func nthUglyNumber(_ n: Int) -> Int {
        var ugs: [Int] = [1]
        var p2 = 0, p3 = 0, p5 = 0
        for _ in 1 ..< n {
            let u2 = ugs[p2] * 2
            let u3 = ugs[p3] * 3
            let u5 = ugs[p5] * 5
            
            let ug = min(u2, u3, u5)
            ugs.append(ug)
            
            if ug == u2 {
                p2 += 1
            }
            if ug == u3 {
                p3 += 1
            }
            if ug == u5 {
                p5 += 1
            }
        }
        
        return ugs[n - 1]
    }
}
