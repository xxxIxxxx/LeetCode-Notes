//
//  125. 验证回文串.swift
//  LCode
//
//  Created by Z on 2021/4/7.
//

class Solution_125_ {
    func isPalindrome(_ s: String) -> Bool {
        let s = s.filter { $0.isLetter || $0.isNumber }.lowercased()
        return s == String(s.reversed())
    }

    func isPalindrome2(_ s: String) -> Bool {
        var s1 = ""
        var s2 = ""

        for c in s {
            if c.isLetter || c.isNumber {
                let a = String(c).lowercased()
                s1 += a
                s2 = a + s2
            }
        }

        return s1 == s2
    }
}
