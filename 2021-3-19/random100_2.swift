//
//  random100.swift
//  LCode
//
//  Created by Z on 2021/3/19.
//

class Random100_2 {
    func random100(_ count: Int) -> [Int] {
        var list: [Int] = Array(1 ... 100)
        var ans: [Int] = []
        for i in 0 ..< count {
            let index = Int.random(in: 0 ..< 100 - i)
            let val = list[index]
            // 交换位置
            list[index] = list[100 - i]
            list[100 - i] = val
            ans.append(val)
        }
        return ans
    }
}
