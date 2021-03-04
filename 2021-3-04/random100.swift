//
//  random100.swift
//  LCode
//
//  Created by Z on 2021/3/4.
//

class Random100 {
    // 如何随机生成不重复的 10个100 以内的数字？
    func random100() -> [Int] {
        var vals: [Int] = []

        while vals.count != 10 {
            let val = Int.random(in: 0 ... 100)
            if !vals.contains(val) {
                vals.append(val)
            }
        }
        return vals
    }
}
