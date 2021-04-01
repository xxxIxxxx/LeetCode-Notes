//
//  104. 二叉树的最大深度.swift
//  LCode
//
//  Created by Z on 2021/4/1.
//

class Solution_104_A {
    // bfs

    // 时间复杂度O(n)
    // 空间复杂度O(n)

    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var stack = [root]
        var ans = 1
        while !stack.isEmpty {
            let count = stack.count
            for _ in 0 ..< count {
                let node = stack.remove(at: 0)
                if node.left != nil {
                    stack.append(node.left!)
                }
                if node.right != nil {
                    stack.append(node.right!)
                }
            }
            if stack.count > 0 {
                ans += 1
            }
        }
        return ans
    }

    // dfs
    // 时间复杂度O(n)
    // 空间复杂度O(n) 最差情况下
    func maxDepth2(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        let left = maxDepth(root.left)
        let right = maxDepth(root.right)
        return max(left, right) + 1
    }
}
