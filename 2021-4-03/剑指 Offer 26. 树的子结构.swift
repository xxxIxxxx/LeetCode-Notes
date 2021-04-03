//
//  剑指 Offer 26. 树的子结构.swift
//  LCode
//
//  Created by Z on 2021/4/3.
//

class Solution_26 {
    // 时间复杂度O(ab) a b 为两个数的节点个数
    // 空间复杂度O(a)
    func isSubStructure(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        guard let b = B, let _ = A else { return false }
        
        var stack: [TreeNode] = []
        var rootA = A
        
        while rootA != nil || !stack.isEmpty {
            while rootA != nil {
                if rootA?.val == b.val {
                    let isSub = dfs(rootA, b)
                    if isSub {
                        return true
                    }
                }
                stack.append(rootA!)
                rootA = rootA?.left
            }
            rootA = stack.popLast()
            rootA = rootA?.right
        }
        return false
    }
    
    func dfs(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        if root1?.val != root2?.val, root2 != nil {
            return false
        }
        if root2 == nil {
            return true
        }
        return dfs(root1?.left, root2?.left) && dfs(root1?.right, root2?.right)
    }
}
