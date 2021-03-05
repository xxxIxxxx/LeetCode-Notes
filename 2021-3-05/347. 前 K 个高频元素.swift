//
//  347. 前 K 个高频元素.swift
//  LCode
//
//  Created by Z on 2021/3/5.
//

class Solution347 {
    // https://leetcode-cn.com/problems/top-k-frequent-elements/
    // 时间复杂度O(n) 1次遍历拿次数。1次遍历放入buck。1次遍历取出
    // 空间复杂度O(n)
    func topKFrequent1(_ nums: [Int], _ k: Int) -> [Int] {
        // key 是值，  value 是次数
        var numMap: [Int: Int] = [:]

        for item in nums {
            let count = numMap[item] ?? 0
            numMap[item] = count + 1
        }

        // 长度为 nums.count + 1
        // 以出现的次数为下标。 值集合 为 item
        var buck: [[Int]] = Array(repeating: [], count: nums.count + 1)

        for item in numMap.keys {
            let count = numMap[item]!
            var list = buck[count]
            list.append(item)
            buck[count] = list
        }

        var ans: [Int] = []

        for item in buck.reversed() {
            ans.append(contentsOf: item)

            if ans.count >= k {
                return Array(ans.prefix(k))
            }
        }

        return []
    }

    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        // key是值 value 是次数
        var numMap: [Int: Int] = [:]

        for item in nums {
            let count = numMap[item] ?? 0
            numMap[item] = count + 1
        }

        // key 是次数 value 是值数组
        var countMap: [Int: [Int]] = [:]
        for item in numMap.keys {
            let val = Int(item)
            let count = numMap[val]!
            var list = countMap[count] ?? []
            list.append(val)
            countMap[count] = list
        }

        let countList = countMap.keys.sorted(by: >)

        var ans: [Int] = []

        for count in countList {
            let key = Int(count)
            let list = countMap[key]!
            ans.append(contentsOf: list)

            if ans.count >= k {
                return Array(ans.prefix(k))
            }
        }

        return []
    }
}
