//
//  剑指 Offer 32 - III. 从上到下打印二叉树 III.swift
//  LCode
//
//  Created by Z on 2021/3/31.
//

class Solution_32_A {
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var ans: [[Int]] = []
        var stack = [root]
        var isLR = true
        while !stack.isEmpty {
            let count = stack.count
            var tempAns: [Int] = []
            for _ in 0 ..< count {
                let node = stack.remove(at: 0)
                if isLR {
                    tempAns.append(node.val)
                } else {
                    tempAns.insert(node.val, at: 0)
                }
                if node.left != nil {
                    stack.append(node.left!)
                }
                if node.right != nil {
                    stack.append(node.right!)
                }
            }
            isLR = !isLR
            ans.append(tempAns)
        }
        return ans
    }
}
