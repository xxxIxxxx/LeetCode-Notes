//
//  108. 将有序数组转换为二叉搜索树.swift
//  LCode
//
//  Created by Z on 2021/3/30.
//

class Solution_108 {
    // 时间复杂度O(n)
    // 空间复杂度O(logn)
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return buildTree(nums, 0, nums.count - 1)
    }

    func buildTree(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {
        if left > right {
            return nil
        }
        let mid = (right - left) / 2 + left
        let root = TreeNode(nums[mid])
        root.left = buildTree(nums, left, mid - 1)
        root.right = buildTree(nums, mid + 1, right)
        return root
    }
}
