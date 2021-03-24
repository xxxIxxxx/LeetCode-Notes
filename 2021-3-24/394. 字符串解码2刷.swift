//
//  394. 字符串解码2刷.swift
//  LCode
//
//  Created by Z on 2021/3/24.
//

class Solution_394 {
    // 时间复杂度O(n) n 为字符串长度
    // 空间复杂度O(n) n 为字符串长度
    func decodeString(_ s: String) -> String {
        // 存放 当前需要重复的次数 和 下一次需要重复的部分字符串
        var stack: [(Int, String)] = []
        var count = 0
        var ansStr = ""
        for char in s {
            if char.isLetter {
                ansStr.append(char)
            } else if char.isNumber {
                count = count * 10 + Int(String(char))!
            } else if char == "[" {
                stack.append((count, ansStr))
                count = 0
                ansStr = ""
            } else {
                if let (count, string) = stack.popLast() {
                    // 但前 ansStr 重复 count  +  下一次重复需要的 string
                    ansStr = string + String(repeating: ansStr, count: count)
                }
            }
        }
        return ansStr
    }

    // 时间复杂度O(n) n 为字符串长度
    // 空间复杂度O(n) n 为字符串长度
    func decodeString2(_ s: String) -> String {
        // 存放 倍数 和 子串
        var strList: [String] = []
        // 子串
        var tempStr = ""
        // 倍数
        var numberStr = ""
        for char in s {
            if char.isNumber {
                if !tempStr.isEmpty {
                    strList.append(tempStr)
                    tempStr = ""
                }
                numberStr.append(char)
            } else if char.isLetter {
                if !numberStr.isEmpty {
                    strList.append(numberStr)
                    numberStr = ""
                }
                tempStr.append(char)
            } else if char == "[" {
                if !numberStr.isEmpty {
                    strList.append(numberStr)
                    numberStr = ""
                }
                if !tempStr.isEmpty {
                    strList.append(tempStr)
                    tempStr = ""
                }
            } else {
                var pStr = strList.removeLast()
                var count = Int(pStr) ?? 0
                if count == 0 { // 说明上面移出的是子串
                    tempStr = pStr + tempStr
                    pStr = strList.removeLast()
                    count = Int(pStr) ?? 0
                }
                if count > 0 {
                    tempStr = String(repeating: tempStr, count: count)
                }
            }
        }

        return strList.joined(separator: "") + tempStr
    }
}
