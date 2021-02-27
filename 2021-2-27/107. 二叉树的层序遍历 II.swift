//
//  107. 二叉树的层序遍历 II.swift
//  LCode
//
//  Created by Z on 2021/2/27.
//
class Solution107 {
    // https://leetcode-cn.com/problems/binary-tree-level-order-traversal-ii/
    // 时间复杂度 O(n) n 为节点数，每个节点访问一次
    // 空间复杂度 O(n) n 为节点数，数组（没用队列，swift没有内置队列）的开销
    
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var ans: [[Int]] = []
        var treeList = [root]
        
        while !treeList.isEmpty {
            let count = treeList.count
            var tempList: [Int] = []
            
            for _ in 0 ..< count {
                let tree = treeList.remove(at: 0)
                tempList.append(tree.val)
                if tree.left != nil {
                    treeList.append(tree.left!)
                }
                if tree.right != nil {
                    treeList.append(tree.right!)
                }
            }
            ans.insert(tempList, at: 0)
        }
        return ans
    }
}
