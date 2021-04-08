//
//  394. 字符串解码.swift
//  LCode
//
//  Created by Z on 2021/4/8.
//

class Solution_394_ {
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    func decodeString(_ s: String) -> String {
        var lastNumber = ""
        var lastStr = ""
        var numberList: [String] = []
        var strList: [String] = []

        for item in s {
            if item.isLetter {
                lastStr += String(item)
            } else if item.isNumber {
                lastNumber += String(item)
            } else if item == "[" {
                numberList.append(lastNumber)
                strList.append(lastStr)
                lastNumber = ""
                lastStr = ""
            } else {
                if let n = numberList.popLast(), let s = strList.popLast() {
                    lastStr = s + String(repeating: lastStr, count: Int(n)!)
                }
            }
        }

        return lastStr
    }
}
