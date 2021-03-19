//
//  347. 前 K 个高频元素2刷.swift
//  LCode
//
//  Created by Z on 2021/3/19.
//

class Solution_347 {
    // 空间换时间
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var numMap: [Int: Int] = [:]
        for item in nums {
            let count = numMap[item] ?? 0
            numMap[item] = count + 1
        }
        var buck: [Set<Int>] = Array(repeating: [], count: nums.count + 1)
        for item in numMap.keys {
            let count = numMap[item]!
            var section = buck[count]
            section.insert(item)
            buck[count] = section
        }
        var ans: [Int] = []

        for i in 0 ..< buck.count {
            let section = buck[buck.count - 1 - i]
            ans.append(contentsOf: section)
            if ans.count == k {
                return ans
            }
        }
        return [0]
    }
}
