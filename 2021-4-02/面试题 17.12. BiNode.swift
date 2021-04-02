//
//  面试题 17.12. BiNode.swift
//  LCode
//
//  Created by Z on 2021/4/2.
//

class Solution17_12_ {
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    // 中序遍历
    // 将当前 root.left 置空
    // 保存当前 root 节点为 lastRoot
    // 下次递归 将 lastRoot.right 设置为当前 root
    // 然后更新 lastRoot 为当前root
    var ans: TreeNode?
    var lastRoot: TreeNode?
    func convertBiNode(_ root: TreeNode?) -> TreeNode? {
        dfs(root)
        return ans
    }

    func dfs(_ root: TreeNode?) {
        guard let root = root else { return }
        dfs(root.left)
        if ans == nil {
            ans = root
        }
        root.left = nil
        lastRoot?.right = root
        lastRoot = root
        dfs(root.right)
    }

    // 时间复杂度O(n)   2次遍历
    // 空间复杂度O(n)
    func convertBiNode2(_ root: TreeNode?) -> TreeNode? {
        var list: [TreeNode] = []
        dfs2(root, &list)
        let dummyNode = TreeNode()
        var headNode = dummyNode

        for node in list {
            node.left = nil
            headNode.right = node
            headNode = headNode.right!
        }
        return dummyNode.right
    }

    func dfs2(_ root: TreeNode?, _ list: inout [TreeNode]) {
        guard let root = root else { return }
        dfs2(root.left, &list)
        list.append(root)
        dfs2(root.right, &list)
    }
}
