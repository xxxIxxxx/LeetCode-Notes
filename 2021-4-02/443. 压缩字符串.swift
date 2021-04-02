//
//  443. 压缩字符串.swift
//  LCode
//
//  Created by Z on 2021/4/2.
//

class Solution_443 {
    func compress(_ chars: inout [Character]) -> Int {
        var lastChr: Character?
        var index = 0
        var count = 1

        while index < chars.count {
            let chr = chars[index]
            if chr == lastChr {
                count += 1
                chars.remove(at: index)
            } else {
                if count > 1 {
                    for cC in "\(count)".reversed() {
                        chars.insert(cC, at: index)
                    }
                    index += "\(count)".count
                }

                count = 1
                lastChr = chr
                index += 1
            }
        }
        if count > 1 {
            for cC in "\(count)" {
                chars.append(cC)
            }
        }

        return chars.count
    }
}
