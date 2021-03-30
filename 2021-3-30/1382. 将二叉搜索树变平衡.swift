//
//  1382. 将二叉搜索树变平衡.swift
//  LCode
//
//  Created by Z on 2021/3/30.
//

class Solution_1382 {
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    func balanceBST(_ root: TreeNode?) -> TreeNode? {
        var nums: [Int] = []
        dfs(root, &nums)
        return buildTree(nums, 0, nums.count - 1)
    }

    func dfs(_ root: TreeNode?, _ nums: inout [Int]) {
        guard let root = root else { return }
        dfs(root.left, &nums)
        nums.append(root.val)
        dfs(root.right, &nums)
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
