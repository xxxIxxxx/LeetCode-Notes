//
//  958. 二叉树的完全性检验.swift
//  LCode
//
//  Created by Z on 2021/4/4.
//

class Solution_958_ {
    // 层序遍历出现一次空节点后，后续不应该再出现非空节点否则不是完全二叉树
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    func isCompleteTree(_ root: TreeNode?) -> Bool {
        guard let root = root else { return false }
        var isNilNode = false
        var stack = [root]
        while !stack.isEmpty {
            let count = stack.count
            for _ in 0 ..< count {
                let node = stack.remove(at: 0)
                if node.left != nil {
                    if isNilNode { return false }
                    stack.append(node.left!)
                } else {
                    isNilNode = true
                }
                if node.right != nil {
                    if isNilNode { return false }
                    stack.append(node.right!)
                } else {
                    isNilNode = true
                }
            }
        }
        return true
    }
}
