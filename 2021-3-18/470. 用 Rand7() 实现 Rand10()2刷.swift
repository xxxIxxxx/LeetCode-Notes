//
//  470. 用 Rand7() 实现 Rand10()2刷.swift
//  LCode
//
//  Created by Z on 2021/3/18.
//

class Solution_470 {
    func rand7() -> Int {
        [1, 2, 3, 4, 5, 6, 7].randomElement()!
    }

    // 时间复杂度最好O(1) 最差无穷
    // 空间复杂度O(1)
//    func rand10() -> Int {
//        while true {
//            let r7 = rand7()
//            let r49 = (r7 - 1) * 7 + rand7()
//            if r49 <= 40 {
//                return r49 % 10 + 1
//            }
//        }
//    }

    func rand10() -> Int {
        while true {
            let r7 = rand7()
            let r49 = (r7 - 1) * 7 + rand7()
            if r49 <= 40 {
                return r49 % 10 + 1
            }
            let r9 = r49 - 40
            let r63 = (r9 - 1) * 7 + rand7()

            if r63 <= 60 {
                return r63 % 10 + 1
            }

            let r3 = r63 - 60
            let r21 = (r3 - 1) * 7 + r7
            if r21 <= 20 {
                return r21 % 10 + 1
            }
        }
    }
}
