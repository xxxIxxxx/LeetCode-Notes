//
//  剑指 Offer 55 - II. 平衡二叉树.swift
//  LCode
//
//  Created by Z on 2021/3/31.
//

class Solution55_2 {
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    var ans = true
    func isBalanced(_ root: TreeNode?) -> Bool {
        _ = dfs(root)
        return ans
    }

    func dfs(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        if ans == false {
            return 0
        }
        let left = dfs(root.left)
        let right = dfs(root.right)

        if abs(left - right) > 1 {
            ans = false
        }
        return max(left, right) + 1
    }
}
