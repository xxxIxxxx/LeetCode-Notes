//
//  443. 压缩字符串.swift
//  LCode
//
//  Created by Z on 2021/3/27.
//

class Solution443 {
    // 时间复杂度 O(n)
    // 空间复杂度O (1)
    func compress(_ chars: inout [Character]) -> Int {
        var lastchar: Character?
        var count = 1
        var curIndex = 0
        var startIndex = 0

        while curIndex < chars.count {
            let char = chars[curIndex]
            if lastchar == char {
                count += 1
                chars.remove(at: curIndex)
            } else {
                if count > 1 {
                    for item in "\(count)" {
                        chars.insert(item, at: startIndex)
                        startIndex += 1
                    }
                    count = 1
                    curIndex = startIndex
                }
                lastchar = char
                curIndex += 1
                startIndex = curIndex
            }
        }
        if count > 1 {
            for item in "\(count)" {
                chars.append(item)
            }
        }

        return chars.count
    }
}
