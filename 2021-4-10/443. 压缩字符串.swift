//
//  443. 压缩字符串.swift
//  LCode
//
//  Created by Z on 2021/4/10.
//

class Solution_443_ {
    // 时间复杂度O(n)
    // 空间复杂度O(1)
    func compress(_ chars: inout [Character]) -> Int {
        var count = 1
        var lastC: Character?
        var index = 0

        while index < chars.count {
            let c = chars[index]
            if lastC == c {
                chars.remove(at: index)
                count += 1
            } else {
                if count > 1 {
                    let countStr = "\(count)"
                    for cc in countStr.reversed() {
                        chars.insert(cc, at: index)
                    }
                    index += countStr.count
                }
                lastC = c
                count = 1
                index += 1
            }
        }

        if count > 1 {
            let countStr = "\(count)"
            for cc in countStr {
                chars.append(cc)
            }
        }

        return chars.count
    }
}
