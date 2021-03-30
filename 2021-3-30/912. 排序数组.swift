//
//  912. 排序数组.swift
//  LCode
//
//  Created by Z on 2021/3/30.
//

class Solution_912 {
    // 时间复杂度O(nlogn)
    // 空间复杂度O(logn) 最坏O(n)
    func sortArray(_ nums: [Int]) -> [Int] {
        var nums = nums
        quickSort(&nums, 0, nums.count - 1)
        return nums
    }

    func quickSort(_ nums: inout [Int], _ left: Int, _ right: Int) {
        if left >= right {
            return
        }
        let pIndex = Int.random(in: left ..< right)
        let p = nums[pIndex]
        swap(&nums, pIndex, right)
        var minIndex = left
        // < right 保证分节点在遍历结束时一直都在 末尾
        for i in left ..< right {
            if nums[i] <= p {
                swap(&nums, i, minIndex)
                minIndex += 1
            }
        }
        swap(&nums, minIndex, right)
        quickSort(&nums, left, minIndex - 1)
        quickSort(&nums, minIndex + 1, right)
    }

    func swap(_ nums: inout [Int], _ a: Int, _ b: Int) {
        let q = nums[a]
        nums[a] = nums[b]
        nums[b] = q
    }
}
