//
//  剑指 Offer 54. 二叉搜索树的第k大节点.swift
//  LCode
//
//  Created by Z on 2021/2/26.
//

// https://leetcode-cn.com/problems/er-cha-sou-suo-shu-de-di-kda-jie-dian-lcof/
class Solution54 {
    // 二叉搜索树特点 left < root < right
    // 使用中序遍历left root right 变形。 right root left
  
    // 时间复杂度 O(n) 最差情况下 每个节点访问一次
    // 空间复杂度 O(n) 最差情况下 递归栈的深度 = 节点个数
    
    var ans: Int?
    
    func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
        var th = 0
        dfs(root, &th, k)
        return ans!
    }
    
    func dfs(_ root: TreeNode?, _ th: inout Int, _ k: Int) {
        guard let root = root else {
            return
        }
        
        dfs(root.right, &th, k)
        th += 1
        if th == k {
            ans = root.val
        }
        // 找到后提前退出
        if ans != nil {
            return
        }
        dfs(root.left, &th, k)
    }
}
