//
//  104. 二叉树的最大深度.swift
//  LCode
//
//  Created by Z on 2021/2/25.
//
// https://leetcode-cn.com/problems/maximum-depth-of-binary-tree/

import Foundation
class Solution104 {
    // DFS
    // 时间复杂度 O(n) 每个节点访问一次
    // 空间复杂度 O(h) h 为树的深度，最差情况下(一条)为 n
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        return 1 + max(maxDepth(root.left), maxDepth(root.right))
    }

    // BFS
    // 时间复杂度 O(n) 每个节点访问一次
    // 空间复杂度 最坏为O(n),取决于宽度
    func maxDepth2(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        var ans = 1
        var treeList: [TreeNode] = [root]

        while !treeList.isEmpty {
            let count = treeList.count
            for _ in 0 ..< count {
                let root = treeList.remove(at: 0)

                if root.left != nil {
                    treeList.append(root.left!)
                }
                if root.right != nil {
                    treeList.append(root.right!)
                }
            }
            ans += 1
        }

        return ans
    }
}
