//
//  125. 验证回文串2刷.swift
//  LCode
//
//  Created by Z on 2021/3/22.
//

class Solution_125 {
    func isPalindrome(_ s: String) -> Bool {
        let s = s.filter { $0.isLetter || $0.isNumber }.lowercased()
        return s == String(s.reversed())
    }
}
