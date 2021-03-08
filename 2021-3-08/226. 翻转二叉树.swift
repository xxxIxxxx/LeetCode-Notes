//
//  226. 翻转二叉树.swift
//  LCode
//
//  Created by Z on 2021/3/8.
//

class Solution226 {
    // 反转二叉树 将每个节点的左右节点交换

    // 时间复杂度O(n)
    // 空间复杂度O(n)
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        var stack = [root]
        while !stack.isEmpty {
            let node = stack.popLast()!
            let tempNode = node.left
            node.left = node.right
            node.right = tempNode
            if node.left != nil {
                stack.append(node.left!)
            }
            if node.right != nil {
                stack.append(node.right!)
            }
        }
        return root
    }
}

class Solution226_1 {
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        dfs(root)
        return root
    }

    func dfs(_ root: TreeNode?) {
        guard let root = root else { return }
        let temp = root.left
        root.left = root.right
        root.right = temp
        dfs(root.left)
        dfs(root.right)
    }
}
