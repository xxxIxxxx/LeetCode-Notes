//
//  347. 前 K 个高频元素.swift
//  LCode
//
//  Created by Z on 2021/4/6.
//

class Solution_347_ {
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var ans: [Int] = []
        var numMap: [Int: Int] = [:]
        for item in nums {
            let c = numMap[item] ?? 0
            numMap[item] = c + 1
        }

        var sectionList: [[Int]] = Array(repeating: [], count: nums.count + 1)
        for key in numMap.keys {
            let index = numMap[key]!
            var section = sectionList[index]
            section.append(key)
            sectionList[index] = section
        }

        for section in sectionList.reversed() {
            if section.count > 0 {
                ans.append(contentsOf: section)
                if ans.count == k {
                    return ans
                }
            }
        }

        return ans
    }
}
