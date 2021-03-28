//
//  94. 二叉树的中序遍历.swift
//  LCode
//
//  Created by Z on 2021/3/28.
//

class Solution94 {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        // Morris 遍历 还是没看懂。。
        []
    }

    // 时间复杂度O(n)
    // 空间复杂度O(h) h 为树的高度
    func inorderTraversal1(_ root: TreeNode?) -> [Int] {
        var root = root
        var ans: [Int] = []
        var stack: [TreeNode] = []

        while root != nil || !stack.isEmpty {
            while root != nil {
                stack.append(root!)
                root = root?.left
            }
            root = stack.popLast()
            ans.append(root!.val)
            root = root?.right
        }

        return ans
    }

    // 时间复杂度O(n)
    // 空间复杂度O(h) h 为树的高度
    func inorderTraversal2(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var ans: [Int] = []
        dfs(root, &ans)
        return ans
    }

    func dfs(_ root: TreeNode?, _ ans: inout [Int]) {
        guard let root = root else { return }
        dfs(root.left, &ans)
        ans.append(root.val)
        dfs(root.right, &ans)
    }
}
