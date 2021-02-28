//
//  572. 另一个树的子树.swift
//  LCode
//
//  Created by Z on 2021/2/28.
//

class Solution572_1 {
    //    https://leetcode-cn.com/problems/subtree-of-another-tree/

    // 思路先将 t 树前序遍历序列化，序列化时需要记录空节点。
    // 然后 s 树前序遍历序列化，将每一次的序列结果和 t 的序列化结果进行判断，相等即包含

    // 时间复杂度O(s + t) t 是 t 树的节点数，s 是 s 树的节点数
    // 空间复杂度O(s + t) t 是 t 树的深度，s 是 s 树的深度

    var ans = false
    var tStr: String = ""

    func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        tStr = dfs(t, true)
        _ = dfs(s, true)
        return ans
    }

    func dfs(_ root: TreeNode?, _ isLeft: Bool) -> String {
        if ans { return "" } // 已经包含，加快退出
        guard let root = root else {
            if isLeft {
                return "L"
            }
            return "R"
        }

        let str = "\(root.val)," + dfs(root.left, true) + dfs(root.right, false)
        if str == tStr {
            ans = true
        }
        return str
    }
}

class Solution572 {
    // 深度优先搜索
    // 时间复杂度 O(st) s 树的每一个节点都要遍历一边和 t.val 匹配，和 t 匹配的时间为 O(t)
    // 对于每一个 s 上的点，都需要做一次深度优先搜索来和 t 匹配，匹配一次的时间代价是 O(∣t∣)，那么总的时间代价就是 O(∣s∣×∣t∣)。故渐进时间复杂度为 O(∣s∣×∣t∣)。

    // 空间复杂度
    // 假设 s 深度为ds, t 的深度为 dt，任意时刻栈空间的最大使用代价是 O(max{ds,dt})。故渐进空间复杂度为O(max{ds,dt})。

    var ans = false

    func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        dfs(s, t)
        return ans
    }

    func dfs(_ root: TreeNode?, _ root2: TreeNode?) {
        guard let root = root else { return }
        if ans == true {
            return
        }
        if root.val == root2?.val {
            ans = isSame(root, root2)
        }
        dfs(root.left, root2)
        dfs(root.right, root2)
    }

    func isSame(_ root: TreeNode?, _ root2: TreeNode?) -> Bool {
        if root == nil, root2 == nil {
            return true
        }
        if root == nil || root2 == nil {
            return false
        }
        if root?.val != root2?.val {
            return false
        }
        let l = isSame(root?.left, root2?.left)
        let r = isSame(root?.right, root2?.right)

        return l && r
    }
}
