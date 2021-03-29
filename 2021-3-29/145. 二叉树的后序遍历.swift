//
//  145. 二叉树的后序遍历.swift
//  LCode
//
//  Created by Z on 2021/3/29.
//

class Solution145 {
    
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var root = root
        var ans: [Int] = []
        var stack: [TreeNode] = []
        var preNode: TreeNode?

        while root != nil || !stack.isEmpty {
            while root != nil {
                stack.append(root!)
                root = root?.left
            }
            root = stack.popLast()
            if root?.right == nil || root?.right === preNode {
                ans.append(root!.val)
                preNode = root
                root = nil
            } else {
                stack.append(root!)
                root = root?.right
            }
        }

        return ans
    }

    // 时间复杂度O(n)
    // 空间复杂度O(n)
    func postorderTraversal2(_ root: TreeNode?) -> [Int] {
        var ans: [Int] = []
        dfs(root, &ans)
        return ans
    }

    func dfs(_ root: TreeNode?, _ ans: inout [Int]) {
        guard let root = root else { return }
        dfs(root.left, &ans)
        dfs(root.right, &ans)
        ans.append(root.val)
    }
}
