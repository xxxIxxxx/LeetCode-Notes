//
//  面试题 17.12. BiNode.swift
//  LCode
//
//  Created by Z on 2021/2/27.
//

class Solution17_12 {
    //    https://leetcode-cn.com/problems/binode-lcci/
    // 时间复杂度O(n) 每个节点访问一次
    // 空间复杂度O(n) 递归栈的深度

    func convertBiNode(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        dfs(root)
        return ans
    }

    var ans: TreeNode?
    var temp: TreeNode?

    func dfs(_ root: TreeNode?) {
        guard let root = root else { return }

        dfs(root.left)
        if ans == nil {
            ans = root
            temp = root
        } else {
            temp?.right = root
            temp = temp?.right
            temp?.left = nil
        }
        dfs(root.right)
    }

    // 超时。。。 使用队列会好点这里使用的数组
    // func convertBiNode(_ root: TreeNode?) -> TreeNode? {
    //     guard let root = root else { return nil }
    //     var treeList: [TreeNode] = []
    //     dfs(root, &treeList)
    //     let ans = treeList[0]
    //     var temp = ans

    //     for i in 1 ..< treeList.count {
    //         temp.right = treeList[i]
    //         temp.left = nil
    //         temp = temp.right!
    //     }

    //     return ans
    // }

    // func dfs(_ root: TreeNode?, _ treeList: inout [TreeNode]) {
    //     guard let root = root else { return }

    //     dfs(root.left, &treeList)
    //     treeList.append(root)
    //     dfs(root.right, &treeList)
    // }
}
