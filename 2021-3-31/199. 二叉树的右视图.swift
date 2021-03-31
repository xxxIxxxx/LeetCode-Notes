//
//  199. 二叉树的右视图.swift
//  LCode
//
//  Created by Z on 2021/3/31.
//

class Solution_199 {
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    func rightSideView(_ root: TreeNode?) -> [Int] {
        var ans: [Int] = []
        dfs(root, 0, &ans)
        return ans
    }

    func dfs(_ root: TreeNode?, _ d: Int, _ ans: inout [Int]) {
        guard let root = root else { return }
        let val = root.val
        if ans.count > d {
            ans[d] = val
        } else {
            ans.append(val)
        }
        dfs(root.left, d + 1, &ans)
        dfs(root.right, d + 1, &ans)
    }

    // 时间复杂度O(n)
    // 空间复杂度O(n)
    func rightSideView2(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var ans: [Int] = []
        var stack = [root]
        while !stack.isEmpty {
            let count = stack.count
            for i in 0 ..< count {
                let node = stack.remove(at: 0)
                if i == count - 1 {
                    ans.append(node.val)
                }
                if node.left != nil {
                    stack.append(node.left!)
                }
                if node.right != nil {
                    stack.append(node.right!)
                }
            }
        }
        return ans
    }
}
