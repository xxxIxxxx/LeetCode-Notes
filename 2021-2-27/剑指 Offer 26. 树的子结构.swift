//
//  剑指 Offer 26. 树的子结构.swift
//  LCode
//
//  Created by Z on 2021/2/27.
//

class Solution26 {
    //    https://leetcode-cn.com/problems/shu-de-zi-jie-gou-lcof/
    // 思路
    // 先找到 A 的某个节点val == B.val, 然后从 A 的当前 root 和 B 去前序对比
    // 时间复杂度O(n) ?
    // 空间复杂度O(n) ?
    var B: TreeNode?
    var ans = false
    
    func isSubStructure(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        if A == nil || B == nil {
            return false
        }
        self.B = B
        dfsA(A)

        return ans
    }
    
    func dfsA(_ root: TreeNode?) {
        guard let root = root else { return }
        if root.val == B?.val {
            ans = isSame(root, B)
            if ans == true {
                return
            }
        }
        dfsA(root.left)
        dfsA(root.right)
    }
    
    func isSame(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        if root2 == nil { // root2 为 空可直接返回 true， 说明 root1 已经包含 root2
            return true
        }
        if root1?.val != root2?.val {
            return false
        }
        
        let l = isSame(root1?.left, root2?.left)
        let r = isSame(root1?.right, root2?.right)
        
        return l && r
    }
}
