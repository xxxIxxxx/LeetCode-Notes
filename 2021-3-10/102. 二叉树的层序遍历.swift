//
//  102. 二叉树的层序遍历.swift
//  LCode
//
//  Created by Z on 2021/3/10.
//

class Solution102 {
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var ans: [[Int]] = []
        var stack: [TreeNode] = [root]

        while !stack.isEmpty {
            var temp: [Int] = []
            let count = stack.count
            for _ in 0 ..< count {
                let tree = stack.removeFirst()
                temp.append(tree.val)

                if let left = tree.left {
                    stack.append(left)
                }

                if let right = tree.right {
                    stack.append(right)
                }
            }
            ans.append(temp)
        }
        return ans
    }
}
