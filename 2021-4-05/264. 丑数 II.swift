//
//  264. 丑数 II.swift
//  LCode
//
//  Created by Z on 2021/4/5.
//

class Solution_264_ {
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    func nthUglyNumber(_ n: Int) -> Int {
        var ugs = [1]
        var p2 = 0, p3 = 0, p5 = 0
        
        for _ in 0 ..< n {
            let u2 = ugs[p2] * 2
            let u3 = ugs[p3] * 3
            let u5 = ugs[p5] * 5
            
            let u = min(u2, u3, u5)
            ugs.append(u)
            if u == u2 {
                p2 += 1
            }
            if u == u3 {
                p3 += 1
            }
            if u == u5 {
                p5 += 1
            }
        }
        
        return ugs[n - 1]
    }
}
