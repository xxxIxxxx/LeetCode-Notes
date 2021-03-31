//
//  226. 翻转二叉树.swift
//  LCode
//
//  Created by Z on 2021/3/31.
//

class Solution_226 {
    
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        var stack: [TreeNode] = [root]
        while !stack.isEmpty {
            let count = stack.count
            for _ in 0 ..< count {
                let node = stack.remove(at: 0)
                let oriLeft = node.left
                node.left = node.right
                node.right = oriLeft
                if node.left != nil {
                    stack.append(node.left!)
                }
                if node.right != nil {
                    stack.append(node.right!)
                }
            }
        }
        return root
    }

    // 时间复杂度O(n)
    // 空间复杂度O(n)
    func invertTree2(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }

        let oriLeft = root.left
        root.left = root.right
        root.right = oriLeft
        _ = invertTree2(root.left)
        _ = invertTree2(root.right)
        return root
    }
}
