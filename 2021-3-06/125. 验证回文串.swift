//
//  125. 验证回文串.swift
//  LCode
//
//  Created by Z on 2021/3/6.
//
import Foundation
class Solution125 {
    //https://leetcode-cn.com/problems/valid-palindrome/
    
    // 也可以使用双指针来对原字符串处理  一个从头 一个从尾
    // 时间复杂度O(n)
    // 空间复杂度O(1)
    
    func isPalindrome(_ s: String) -> Bool {
        let s = s.filter { $0.isLetter || $0.isNumber }.lowercased()
        return s == String(s.reversed())
    }
}
