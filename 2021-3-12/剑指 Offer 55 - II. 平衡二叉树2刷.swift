//
//  剑指 Offer 55 - II. 平衡二叉树.swift
//  LCode
//
//  Created by Z on 2021/3/12.
//

class Solution_55_2 {
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    // 思路 后续遍历 从底到顶 判断每个节点的左右子树深度差是否 >=2 不满足
    func isBalanced(_ root: TreeNode?) -> Bool {
        return dfs(root) != -1
    }

    func dfs(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        let left = dfs(root.left)
        // 已经不是平衡二叉树退出剪枝
        if left == -1 { return -1 }
        let right = dfs(root.right)
        // 已经不是平衡二叉树退出剪枝
        if right == -1 { return -1 }

        // 每个节点的左右子树深度差小于 2 满足平衡二叉树返回最大的深度，不满足返回 -1
        return abs(left - right) < 2 ? max(left, right) + 1 : -1
    }
}
