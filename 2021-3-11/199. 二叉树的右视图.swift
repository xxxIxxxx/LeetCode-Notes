//
//  199. 二叉树的右视图.swift
//  LCode
//
//  Created by Z on 2021/3/11.
//

class Solution199 {
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var ans: [Int] = []
        var list: [TreeNode] = [root]
        while !list.isEmpty {
            var last: Int?
            var tempList: [TreeNode] = []

            for node in list {
                last = node.val
                if let left = node.left {
                    tempList.append(left)
                }
                if let right = node.right {
                    tempList.append(right)
                }
            }
            list = tempList
            if let last = last {
                ans.append(last)
            }
        }
        return ans
    }
}
