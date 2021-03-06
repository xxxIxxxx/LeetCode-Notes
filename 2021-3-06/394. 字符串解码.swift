//
//  394. 字符串解码.swift
//  LCode
//
//  Created by Z on 2021/3/6.
//

class Solution {
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    // https://leetcode-cn.com/problems/decode-string/solution/ti-jie-czhan-by-youlookdeliciousc/
    func decodeString(_ s: String) -> String {
        // 存放数字 即重复次数
        var nums: [Int] = []
        // 存放需要重复的字母
        var strs: [String] = []
        // 临时次数
        var num = 0
        // 临时字母
        var str = ""

        for c in s {
            if c.isNumber {
                // num * 10 考虑到多位数，
                num = num * 10 + Int(String(c))!
            } else if c.isLetter { // 是字母 就拼接上
                str += String(c)
            } else if String(c) == "[" {
                // 储存
                nums.append(num)
                strs.append(str)
                num = 0
                str = ""
            } else {
                // 取出
                let count = nums.popLast()!
                var tempStr = strs.popLast()!

                // 重复
                for _ in 0 ..< count {
                    tempStr += str
                }
                // 处理完了一对[] 应该把 当前值赋给 str
                str = tempStr
            }
        }
        return str
    }
}
