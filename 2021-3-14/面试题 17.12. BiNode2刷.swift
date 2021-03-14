//
//  面试题 17.12. BiNode2刷.swift
//  LCode
//
//  Created by Z on 2021/3/14.
//

class Solution_1712_2 {
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    // 关键中序遍历
    var ans: TreeNode?
    var temp: TreeNode?
    func convertBiNode(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        dfs(root)
        return ans
    }

    func dfs(_ root: TreeNode?) {
        guard let root = root else { return }
        dfs(root.left)
        if ans == nil {
            // 记录头节点
            ans = root
            temp = root
        } else {
            temp?.right = root
            temp = temp?.right
            temp?.left = nil
        }
        dfs(root.right)
    }
}
