//
//  112. 路径总和.swift
//  LCode
//
//  Created by Z on 2021/3/31.
//

class Solution_122 {
    
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else { return false }
        var stack: [TreeNode] = [root]
        var sumList: [Int] = [root.val]
        
        while !stack.isEmpty {
            let count = stack.count
            for _ in 0 ..< count {
                let node = stack.remove(at: 0)
                let val = sumList.remove(at: 0)
                
                if node.left != nil {
                    stack.append(node.left!)
                    sumList.append(val + node.left!.val)
                }
                if node.right != nil {
                    stack.append(node.right!)
                    sumList.append(val + node.right!.val)
                }
                if node.left == nil, node.right == nil, val == targetSum {
                    return true
                }
            }
        }
        
        return false
    }
    
    // 时间复杂度O(n)
    // 空间复杂度O(n) 最差情况下为一条链
    func hasPathSum2(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        // root = nil 时 ruturn false，因为树不存在，不用考虑 目标值
        guard let root = root else { return false }
        let curSum = targetSum - root.val
        if curSum == 0, root.left == nil, root.right == nil {
            // 当前和 = 0，左右子树为空即当前节点为叶子节点 则满足
            // 同时这时返回了 也不会再走到 root = nil 了
            return true
        }
        // 左子树true 时就直接返回true了
        return hasPathSum(root.left, curSum) || hasPathSum(root.right, curSum)
    }
}
