//
//  958. 二叉树的完全性检验.swift
//  LCode
//
//  Created by Z on 2021/2/28.
//

class Solution958 {
    //    https://leetcode-cn.com/problems/check-completeness-of-a-binary-tree/
    // 时间复杂度 O(n)
    // 空间复杂度 O(n)
    
    func isCompleteTree(_ root: TreeNode?) -> Bool {
        guard let root = root else { return false }
        var treeList = [root]
        var level = 0
        // 记录每一层是否满层
        var isFull = treeList.count == (1 << level)
        // 如果出现了一层不是满层，然后下面还有一层 就不是完全二叉树
        
        while !treeList.isEmpty {
            var temp: [TreeNode] = []
            
            // [1,2,3,5,null,7,8] 记录这种情况
            var rightIsNil = false
            for item in treeList {
                // [1,2,3,5,null,7,8] 记录这种情况
                if rightIsNil, item.left != nil || item.right != nil {
                    return false
                }
                
                if item.left == nil, item.right != nil {
                    // 左为空 右不为空 不是完全二叉树
                    return false
                }
                if item.left != nil {
                    temp.append(item.left!)
                }
                if item.right != nil {
                    temp.append(item.right!)
                } else {
                    // [1,2,3,5,null,7,8] 记录这种情况
                    rightIsNil = true
                }
            }
            if !isFull, !temp.isEmpty {
                // 如果出现了一层不是满层，然后下面还有一层 就不是完全二叉树
                return false
            }
            level += 1
            isFull = temp.count == (1 << level)
            treeList = temp
        }
        
        return true
    }
}
