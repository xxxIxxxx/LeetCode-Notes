//
//  144. 二叉树的前序遍历.swift
//  LCode
//
//  Created by Z on 2021/3/29.
//

class Solution144 {
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    func preorderTraversal1(_ root: TreeNode?) -> [Int] {
        var root = root
        var ans: [Int] = []
        var stack: [TreeNode] = []
        while root != nil || !stack.isEmpty {
            while root != nil {
                ans.append(root!.val)
                stack.append(root!)
                root = root?.left
            }
            root = stack.popLast()
            root = root?.right
        }

        return ans
    }

    // 时间复杂度O(n)
    // 空间复杂度O(n)
    func preorderTraversal2(_ root: TreeNode?) -> [Int] {
        var ans: [Int] = []
        dfs(root, &ans)
        return ans
    }

    func dfs(_ root: TreeNode?, _ ans: inout [Int]) {
        guard let root = root else { return }
        ans.append(root.val)
        dfs(root.left, &ans)
        dfs(root.right, &ans)
    }
}
