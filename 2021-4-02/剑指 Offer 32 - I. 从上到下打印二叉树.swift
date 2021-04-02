//
//  剑指 Offer 32 - I. 从上到下打印二叉树.swift
//  LCode
//
//  Created by Z on 2021/4/2.
//

class Solution_32_ {
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    func levelOrder(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var ans: [Int] = []
        var stack = [root]
        while !stack.isEmpty {
            let count = stack.count
            for _ in 0 ..< count {
                let node = stack.remove(at: 0)
                ans.append(node.val)
                if node.left != nil {
                    stack.append(node.left!)
                }
                if node.right != nil {
                    stack.append(node.right!)
                }
            }
        }

        return ans
    }
}
