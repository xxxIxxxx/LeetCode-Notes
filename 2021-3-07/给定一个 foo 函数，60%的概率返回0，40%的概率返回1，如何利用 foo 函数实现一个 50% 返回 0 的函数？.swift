//
//  给定一个 foo 函数，60%的概率返回0，40%的概率返回1，如何利用 foo 函数实现一个 50% 返回 0 的函数？.swift
//  LCode
//
//  Created by Z on 2021/3/7.
//

class SolutionFoo {
//    给定一个 foo 函数，60%的概率返回0，40%的概率返回1，
//    如何利用 foo 函数实现一个 50% 返回 0 的函数？

    func foo() -> Int {
        [0, 1, 0, 1, 0].randomElement()!
    }

    // 0 0
    // 0 1
    // 1 0
    // 1 1

    func f50() -> Int {
        while true {
            let a = foo()
            let b = foo()

            // 只考虑 a != b 的情况 ，a != b 有只两种情况 0 1 和 1 0
            if a != b {
                return a
            }
        }
    }
}
