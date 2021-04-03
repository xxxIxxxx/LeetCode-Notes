//
//  572. 另一个树的子树.swift
//  LCode
//
//  Created by Z on 2021/4/3.
//

class Solution_572 {
    // 时间复杂度O(s+t)
    // 空间复杂度O(s)
    var ans = false
    var tStr = ""
    func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        tStr = dfs(t)
        _ = dfs(s)
        return ans
    }

    func dfs(_ root: TreeNode?) -> String {
        guard let root = root else { return "#" }
        let str = "N\(root.val)" + "L\(dfs(root.left))" + "R\(dfs(root.right))"
        if str == tStr {
            ans = true
        }
        return str
    }

    // 时间复杂度O(st) s t 是两个数的节点数
    // 空间复杂度O(t)
    func isSubtree2(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        var s = s
        var stack: [TreeNode] = []
        while s != nil || !stack.isEmpty {
            while s != nil {
                if s?.val == t?.val {
                    let ans = dfs2(s, t)
                    if ans {
                        return ans
                    }
                }
                stack.append(s!)
                s = s?.left
            }
            s = stack.popLast()
            s = s?.right
        }

        return false
    }

    func dfs2(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        if root1?.val != root2?.val {
            return false
        }
        if root1 == nil, root2 == nil {
            return true
        }
        return dfs2(root1?.left, root2?.left) && dfs2(root1?.right, root2?.right)
    }
}
