//
//  543. 二叉树的直径.swift
//  LCode
//
//  Created by Z on 2021/2/26.
//

class Solution543 {
    // https://leetcode-cn.com/problems/diameter-of-binary-tree/
    // 二叉树的直径 = 最大的两个叶子节点之间的距离(不一定过第一个根节点)
    //            = 该根结点的 左子树深度 + 右子树深度
    
    // 时间复杂度 O(n) 每个节点访问一次
    // 空间复杂度 O(n) n 为树的深度即递归栈数
    var ans = 0
    
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        _ = dfs(root)
        return ans
    }
    
    func dfs(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        let l = dfs(root.left)
        let r = dfs(root.right)
        
        ans = max(l + r, ans)
        
        return max(l, r) + 1 // 这里返回的是每一个根节点的深度
    }
}
