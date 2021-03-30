//
//  236. 二叉树的最近公共祖先.swift
//  LCode
//
//  Created by Z on 2021/3/30.
//

class Solution236 {
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        var parentMap: [Int: TreeNode] = [:]
        var commSet: Set<Int> = []
        
        dfs(root, &parentMap)
        var p = p, q = q
        
        while p != nil {
            commSet.insert(p!.val)
            p = parentMap[p!.val]
        }
        
        while q != nil {
            if commSet.contains(q!.val) {
                return q
            }
            q = parentMap[q!.val]
        }
        
        return nil
    }
    
    func dfs(_ root: TreeNode?, _ parentMap: inout [Int: TreeNode]) {
        if let left = root?.left {
            parentMap[left.val] = root
            dfs(left, &parentMap)
        }
        if let right = root?.right {
            parentMap[right.val] = root
            dfs(right, &parentMap)
        }
    }

    // 时间复杂度O(n)
    // 空间复杂度O(n)
    var ans: TreeNode?
    func lowestCommonAncestor2(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        _ = dfs2(root, p, q)
        return ans
    }
    
    func dfs2(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard let root = root else { return false }
        
        let left = dfs2(root.left, p, q)
        let right = dfs2(root.right, p, q)
        
        if (left && right) || ((left || right) && (root.val == p?.val || root.val == q?.val)) {
            ans = root
        }
        
        return root.val == p?.val || root.val == q?.val || left || right
    }
}
