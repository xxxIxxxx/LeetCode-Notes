//
//  给定一个 foo 函数，60%的概率返回0，40%的概率返回1，.swift
//  LCode
//
//  Created by Z on 2021/3/27.
//

class RandFoo {
    func foo() -> Int {
        [0, 1, 0, 1, 0].randomElement()!
    }

    func foo2() -> Int {
        while true {
            let a = foo()
            let b = foo()
            if a != b {
                return a
            }
        }
    }
}
