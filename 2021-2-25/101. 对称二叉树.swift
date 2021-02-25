//
//  101. 对称二叉树.swift
//  LCode
//
//  Created by Z on 2021/2/25.
//
// https://leetcode-cn.com/problems/symmetric-tree/
import Foundation
class Solution101 {
    // 如果一个树的左子树与右子树镜像对称，那么这个树是对称的。
    // 可以转化为 两个树在什么情况下是镜像的
    // 1. 根节点的值相同
    // 2. 每个树的左子树与右子树镜像对称

    // 迭代法
    // 时间复杂度 O(n)
    // 空间复杂度 O(n)
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        var treeList: [TreeNode] = [root, root]
        while !treeList.isEmpty {
            let r1 = treeList.remove(at: 0)
            let r2 = treeList.remove(at: 0)

            if r1.val != r2.val {
                return false
            }

            if r1.left?.val != r2.right?.val {
                return false
            }

            if r1.right?.val != r2.left?.val {
                return false
            }

            if r1.left != nil, r2.right != nil {
                treeList.append(r1.left!)
                treeList.append(r2.right!)
            } else {
                return false
            }

            if r1.right != nil, r2.left != nil {
                treeList.append(r1.right!)
                treeList.append(r2.left!)
            } else {
                return false
            }
        }

        return true
    }

    // 递归
    // 时间复杂度 O(n)
    // 空间复杂度 O(n)

    func isSymmetric2(_ root: TreeNode?) -> Bool {
        return check(root, root)
    }

    func check(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil && right == nil {
            return true
        }
        if left == nil || right == nil {
            return false
        }

        return left?.val == right?.val && check(left?.left, right?.right) && check(left?.right, right?.left)
    }
}
