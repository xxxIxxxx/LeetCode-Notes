//
//  104. 二叉树的最大深度.swift
//  LCode
//
//  Created by Z on 2021/3/12.
//

class Solution_104_2 {
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    // 后续遍历 从底到顶
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        let left = maxDepth(root.left)
        let right = maxDepth(root.right)

        return max(left, right) + 1
    }

    // 时间复杂度O(n)
    // 空间复杂度O(n)
    // 前序遍历 从顶到底
    func maxDepth2(_ root: TreeNode?) -> Int {
        return dfs(root, 0)
    }

    func dfs(_ root: TreeNode?, _ d: Int) -> Int {
        guard let root = root else { return d }
        let a = d + 1
        let left = dfs(root.left, a)
        let right = dfs(root.right, a)
        return max(left, right)
    }
}
