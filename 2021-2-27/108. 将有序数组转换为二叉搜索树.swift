//
//  108. 将有序数组转换为二叉搜索树.swift
//  LCode
//
//  Created by Z on 2021/2/27.
//

class Solution108 {
    // 中序遍历
//    https://leetcode-cn.com/problems/convert-sorted-array-to-binary-search-tree/
    
    // 时间复杂度O(n) n 为数组长度
    // 空间复杂度 O(logn) n 为数组长度，主要是递归栈的深度
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return getTree(nums, 0, nums.count - 1)
    }
    
    func getTree(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {
        if left >= right {
            return nil
        }
        
        let mid = (right - left) / 2 + left
        let val = nums[mid]
        let tree = TreeNode(val)
        tree.left = getTree(nums, left, mid - 1)
        tree.right = getTree(nums, mid + 1, right)
        
        return tree
    }
}
