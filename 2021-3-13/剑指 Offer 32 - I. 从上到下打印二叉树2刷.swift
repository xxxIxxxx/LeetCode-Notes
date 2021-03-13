//
//  剑指 Offer 32 - I. 从上到下打印二叉树2刷.swift
//  LCode
//
//  Created by Z on 2021/3/13.
//

class Solution_32_1 {
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    func levelOrder(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var ans: [Int] = []
        var list = [root]
        while !list.isEmpty {
            let root = list.removeFirst()
            ans.append(root.val)
            if root.left != nil {
                list.append(root.left!)
            }
            if root.right != nil {
                list.append(root.right!)
            }
        }
        return ans
    }
}
