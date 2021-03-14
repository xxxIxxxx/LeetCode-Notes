//
//  剑指 Offer 26. 树的子结构2刷.swift
//  LCode
//
//  Created by Z on 2021/3/14.
//

class Solution_26_2 {
    var ans = true
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    func isSubStructure(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        guard let A = A, let B = B else { return false }
        var list = [A]

        while !list.isEmpty {
            let root = list.removeFirst()
            if root.val == B.val {
                dfs(root, B)
                if ans == true {
                    return ans
                }
                ans = true
            }
            if let left = root.left {
                list.append(left)
            }
            if let right = root.right {
                list.append(right)
            }
        }

        return false
    }

    func dfs(_ root1: TreeNode?, _ root2: TreeNode?) {
        // root2 = nil 没节点了就可以停了， ans = false 提前退出
        if root2 == nil || ans == false {
            return
        }
        if root1 == nil, root2 == nil {
            return
        }
        if root1?.val != root2?.val {
            ans = false
        }
        dfs(root1?.left, root2?.left)
        dfs(root1?.right, root2?.right)
    }

}
