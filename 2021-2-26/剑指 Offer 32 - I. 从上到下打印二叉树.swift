//
//  剑指 Offer 32 - I. 从上到下打印二叉树.swift
//  LCode
//
//  Created by Z on 2021/2/26.
//

class Solution32 {
    // https://leetcode-cn.com/problems/cong-shang-dao-xia-da-yin-er-cha-shu-lcof/

    // 时间复杂度 O(n) 每个节点访问一次
    // 空间复杂度 O(n) 用来存放节点值

    func levelOrder(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var ans: [Int] = []
        var treeList: [TreeNode] = [root]

        while !treeList.isEmpty {
            let count = treeList.count
            for _ in 0 ..< count {
                let tree = treeList.remove(at: 0)
                ans.append(tree.val)
                if tree.left != nil {
                    treeList.append(tree.left!)
                }
                if tree.right != nil {
                    treeList.append(tree.right!)
                }
            }
        }
        return ans
    }
}
