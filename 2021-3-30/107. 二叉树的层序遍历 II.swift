//
//  107. 二叉树的层序遍历 II.swift
//  LCode
//
//  Created by Z on 2021/3/30.
//

class Solution107 {
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var ans: [[Int]] = []
        var treeList = [root]

        while !treeList.isEmpty {
            let count = treeList.count
            var tempList: [Int] = []

            for _ in 0 ..< count {
                let node = treeList.remove(at: 0)
                tempList.append(node.val)

                if node.left != nil {
                    treeList.append(node.left!)
                }

                if node.right != nil {
                    treeList.append(node.right!)
                }
            }
            ans.insert(tempList, at: 0)
        }

        return ans
    }
}
