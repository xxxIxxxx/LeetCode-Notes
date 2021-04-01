//
//  543. 二叉树的直径.swift
//  LCode
//
//  Created by Z on 2021/4/1.
//

class Solution_543_A {
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    var ans = 0
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        _ = dfs(root)
        return ans
    }

    func dfs(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        let left = dfs(root.left)
        let right = dfs(root.right)

        ans = max(ans, left + right)
        return max(left, right) + 1
    }
}
