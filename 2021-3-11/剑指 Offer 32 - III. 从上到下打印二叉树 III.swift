//
//  剑指 Offer 32 - III. 从上到下打印二叉树 III.swift
//  LCode
//
//  Created by Z on 2021/3/11.
//

class Solution_32 {
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var ans: [[Int]] = []
        var list = [root]
        var isLR = true

        while !list.isEmpty {
            let count = list.count
            var temp: [Int] = []
            for _ in 0 ..< count {
                let node = list.removeFirst()
                if isLR {
                    temp.append(node.val)
                } else {
                    temp.insert(node.val, at: 0)
                }
                if let left = node.left {
                    list.append(left)
                }
                if let right = node.right {
                    list.append(right)
                }
            }
            isLR = !isLR
            ans.append(temp)
        }

        return ans
    }
}
