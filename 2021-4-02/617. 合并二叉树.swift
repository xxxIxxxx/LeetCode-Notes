//
//  617. 合并二叉树.swift
//  LCode
//
//  Created by Z on 2021/4/2.
//

class Solution617_A1 {
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        guard let root1 = root1 else { return root2 }
        guard let root2 = root2 else { return root1 }
        let rVal = root1.val + root2.val
        let nRoot = TreeNode(rVal)
        nRoot.left = mergeTrees(root1.left, root2.left)
        nRoot.right = mergeTrees(root1.right, root2.right)
        return nRoot
    }
}
