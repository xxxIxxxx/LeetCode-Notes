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
    
    // 时间复杂度O(MN)：其中 M,N 分别为树 A 和 树 B 的节点数量；先序遍历树 A 占用 O(M) ，每次调用 recur(A, B) 判断占用 O(N) 。
    // 空间复杂度 O(M) ： 当树 A 和树 B 都退化为链表时，递归调用深度最大。当 M≤N 时，遍历树 A 与递归判断的总递归深度为 M ；当 M>N 时，最差情况为遍历至树 A 叶子节点，此时总递归深度为 M。

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
