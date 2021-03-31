//
//  102. 二叉树的层序遍历.swift
//  LCode
//
//  Created by Z on 2021/3/31.
//

class Solution_102 {
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var ans: [[Int]] = []
        var stack = [root]
        while !stack.isEmpty {
            let count = stack.count
            var tempList: [Int] = []

            for _ in 0 ..< count {
                let node = stack.remove(at: 0)
                tempList.append(node.val)
                if node.left != nil {
                    stack.append(node.left!)
                }
                if node.right != nil {
                    stack.append(node.right!)
                }
            }
            ans.append(tempList)
        }
        return ans
    }
}
