//
//  random100.swift
//  LCode
//
//  Created by Z on 2021/3/4.
//
import Foundation

class Random100 {
    // 如何随机生成不重复的 10个100 以内的数字？
    // https://www.cnblogs.com/myseries/p/10722001.html
    func random100() -> [Int] {
        var ans: [Int] = []

        var numeList: [Int] = []
        for i in 0 ... 100 {
            numeList.append(i)
        }

        for i in 0 ..< 10 {
            let index = Int.random(in: 0 ... 100 - i)
            let val = numeList[index]
            ans.append(val)
            numeList[index] = numeList[100 - i]
            numeList[100 - i] = val
        }

        return ans
    }
}
