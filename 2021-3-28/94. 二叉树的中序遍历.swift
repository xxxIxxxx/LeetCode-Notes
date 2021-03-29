//
//  94. 二叉树的中序遍历.swift
//  LCode
//
//  Created by Z on 2021/3/28.
//

class Solution94 {
    // Morris 遍历 最终是把二叉树拉成了链表
    // 时间复杂度O(n) 实际为 2n
    // 空间复杂度O(1)
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var root = root
        var preNode: TreeNode?
        var ans: [Int] = []

        while root != nil {
            // 左子树不为空
            if root?.left != nil {
                // 找到左子树最右边的节点
                preNode = root?.left
                while preNode?.right != nil {
                    preNode = preNode?.right
                }
                // preNode 当前是最右的节点，且没有右子树
                // 把root 接到 preNode.right
                preNode?.right = root
                // 先记录root，后续需要把 root.left 打断
                let temp = root
                // 移动root 到 root.left
                root = root?.left
                // 把之前的root.left 打断
                temp?.left = nil
            } else {
                // 左子树为空 就说明在一条链上了
                ans.append(root!.val)
                root = root?.right
            }
        }

        return ans
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
