//
//  572. 另一个树的子树2刷.swift
//  LCode
//
//  Created by Z on 2021/3/15.
//

class Solution_572_1 {
    // 时间复杂度O(s+t) s t 为两个树的节点数
    // 空间复杂度O(s+t) s t 为两个树的节点数
    var tStr: String?
    var ans = false

    func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        tStr = dfs(t)
        _ = dfs(s)
        return ans
    }

    func dfs(_ root: TreeNode?) -> String {
        if ans {
            return""
        }
        guard let root = root else { return "#" }
        let left = "L" + dfs(root.left)
        let right = "R" + dfs(root.right)
        let str = "R\(root.val)" + left + right
        if str == tStr {
            ans = true
        }
        return str
    }
}

class Solution_572_2 {
    // 时间复杂度O(st) s t 为两个树的节点数
    // 空间复杂度O(d) d 为深度最大的那个树的深度
    var ans = true

    func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        guard let s = s else { return false }
        var list = [s]

        while !list.isEmpty {
            let node = list.removeFirst()
            if node.val == t?.val {
                _ = dfs(node, t)
                if ans == true {
                    return ans
                }
                ans = true
            }
            if node.left != nil {
                list.append(node.left!)
            }
            if node.right != nil {
                list.append(node.right!)
            }
        }

        return false
    }

    func dfs(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        if ans == false {
            return false
        }
        if root1?.val != root2?.val {
            ans = false
            return false
        }
        if root1 == nil, root2 == nil {
            return true
        }
        let left = dfs(root1?.left, root2?.left)
        let right = dfs(root1?.right, root2?.right)

        return left && right
    }
}
