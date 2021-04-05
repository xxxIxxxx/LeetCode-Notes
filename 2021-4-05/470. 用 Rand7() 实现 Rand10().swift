//
//  470. 用 Rand7() 实现 Rand10().swift
//  LCode
//
//  Created by Z on 2021/4/5.
//

class Solution7_10 {
    func rand7() -> Int {
        0
    }

    // 时间复杂度最优O(1) 最差无穷
    // 空间复杂度O(1)
    func rand10() -> Int {
        while true {
            let r49 = (rand7() - 1) * 7 + rand7()
            if r49 <= 40 {
                return r49 % 10 + 1
            }
            let r9 = r49 - 40
            let r63 = (rand7() - 1) * 9 + r9
            if r63 <= 60 {
                return r63 % 10 + 1
            }
        }
    }
}
