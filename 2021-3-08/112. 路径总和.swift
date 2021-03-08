//
//  112. 路径总和.swift
//  LCode
//
//  Created by Z on 2021/3/8.
//

class Solution112 {
    // 时间复杂度O(n) n为节点数
    // 空间复杂度O(h) h 树的高度 最坏O(n)   平均情况下树的高度与节点数的对数正相关，空间复杂度为O(logn)
    var ans = false
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        dfs(root, targetSum)
        return ans
    }

    func dfs(_ root: TreeNode?, _ sum: Int) {
        if root == nil || ans == true {
            return
        }
        if sum - root!.val == 0, root?.left == nil, root?.right == nil {
            ans = true
        }
        dfs(root?.left, sum - root!.val)
        dfs(root?.right, sum - root!.val)
    }
}

class Solution112_1 {
    // 时间复杂度O(n) n为节点数
    // 空间复杂度O(h) h 树的高度 最坏O(n)   平均情况下树的高度与节点数的对数正相关，空间复杂度为O(logn)
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else { return false }
        if root.left == nil, root.right == nil {
            return root.val == targetSum
        }

        return hasPathSum(root.left, targetSum - root.val) || hasPathSum(root.right, targetSum - root.val)
    }
}

class Solution112_2 {
    // 时间复杂度O(n)
    // 空间复杂度O(n) n
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else { return false }
        var stack: [TreeNode] = [root]
        var sums: [Int] = [root.val]

        while !stack.isEmpty {
            let node = stack.popLast()!
            let val = sums.popLast()!
            if node.left == nil, node.right == nil, val == targetSum {
                return true
            }

            if node.left != nil {
                stack.append(node.left!)
                sums.append(val + node.left!.val)
            }
            if node.right != nil {
                stack.append(node.right!)
                sums.append(val + node.right!.val)
            }
        }

        return false
    }
}
