//
//  543. 二叉树的直径.swift
//  LCode
//
//  Created by Z on 2021/3/13.
//

class Solution_543_2 {
    // 二叉树的直径 是指两个节点间的最大路径  两个节点间的 所有节点数 + 1 (就是树图中连接的小线段个数)
    // 最大路径那么这两个节点一定是叶子节点，但不一定过 根节点
    // 那么可以确定 这两个节点有一个公共根节点 rootA
    // 这个根节点 rootA 也可能就是这两个叶子节点的某一个或两个
    // 那最大直径等于 rooA 的左子树深度 + 右子树深度
    
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    
    var ans = 0
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        _ = dfs(root)
        return ans
    }
    
    func dfs(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        let left = dfs(root.left)
        let right = dfs(root.right)
        
        ans = max(left + right, ans)
        
        return max(left, right) + 1 // 返回的是最大深度
    }
}
