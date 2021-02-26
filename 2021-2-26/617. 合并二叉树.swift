//
//  617. 合并二叉树.swift
//  LCode
//
//  Created by Z on 2021/2/26.
//

class Solution617 {
    //
    // https://leetcode-cn.com/problems/merge-two-binary-trees/
    //
    // 时间复杂度O(n) n 为节点数最小的那个二叉树的节点数
    // 空间复杂度O(n) n 为深度最小的那个二叉树的深度
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        // 如果一树为空了可以直接返回另一树的节点了
        // 因为只有两树都不为空时才需要合并
        // 否则一树为空直接返回另一树
        guard let root1 = root1 else { return root2 }
        guard let root2 = root2 else { return root1 }
        let val = root1.val + root2.val
        
        let tree = TreeNode(val)
        tree.left = mergeTrees(root1.left, root2.left)
        tree.right = mergeTrees(root1.right, root2.right)
        return tree
    }
    
    // 时间复杂度 O(n) n 为节点数最大的那个二叉树的节点数
    // 空间复杂度 O(n) n 为深度最大的那个二叉树的深度
    
    func mergeTrees1(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        if root1 == nil, root2 == nil {
            return nil
        }
        let val = (root1?.val ?? 0) + (root2?.val ?? 0)
        
        var root1 = root1
        var root2 = root2
        if root1 == nil {
            root1 = TreeNode(0)
        }
        if root2 == nil {
            root2 = TreeNode(0)
        }
        
        let tree = TreeNode(val)
        
        tree.left = mergeTrees1(root1?.left, root2?.left)
        tree.right = mergeTrees1(root1?.right, root2?.right)
        
        return tree
    }
    
    // 超时。。
    // 主要存储 3 个 root 使用的是 数组，没有使用队列。
    // swift 没有内置队列
    
    func mergeTrees3(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        guard let roo1 = root1 else { return root2 }
        guard let roo2 = root2 else { return root1 }
        let root = TreeNode(roo1.val + roo2.val)
        
        var rootList1 = [roo1]
        var rootList2 = [roo2]
        var rootList = [root]
        
        while !rootList1.isEmpty, !rootList2.isEmpty {
            let r = rootList.remove(at: 0)
            let r1 = rootList1.remove(at: 0)
            let r2 = rootList2.remove(at: 0)

            let r1L = r1.left
            let r1R = r1.right
            let r2L = r2.left
            let r2R = r2.right

            if r1L == nil {
                r.left = r2L
            }
            if r1R == nil {
                r.right = r2R
            }
            if r2L == nil {
                r.left = r1L
            }
            if r2R == nil {
                r.right = r1R
            }
            
            if r1L != nil, r2L != nil {
                r.left = TreeNode(r1L!.val + r2L!.val)
                rootList.append(root.left!)
                rootList1.append(roo1.left!)
                rootList2.append(roo2.left!)
            }
            
            if r1R != nil, r2R != nil {
                r.right = TreeNode(r1R!.val + r2R!.val)
                rootList.append(root.right!)
                rootList1.append(roo1.right!)
                rootList2.append(roo2.right!)
            }
        }
        
        return root
    }
}
