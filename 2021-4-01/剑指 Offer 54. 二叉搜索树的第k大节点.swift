//
//  剑指 Offer 54. 二叉搜索树的第k大节点.swift
//  LCode
//
//  Created by Z on 2021/4/1.
//

class Solution_54_A {
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    // 中序遍历的 变形法  中序遍历是了Left Root  Right 对应 小中大
    // 变形后 Right Root left 对应 大中小
    var ans: Int?
    var k = 0
    func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
        var d = 0
        self.k = k
        dfs(root, &d)
        return ans!
    }

    func dfs(_ root: TreeNode?, _ d: inout Int) {
        guard let root = root else { return }
        if ans != nil {
            return
        }
        dfs(root.right, &d)
        d += 1
        if d == k {
            ans = root.val
        }
        dfs(root.left, &d)
    }

    // 时间复杂度O(n)
    // 空间复杂度O(n)
    func kthLargest2(_ root: TreeNode?, _ k: Int) -> Int {
        var list: [Int] = []
        dfs2(root, k, &list)
        return list.first!
    }

    func dfs2(_ root: TreeNode?, _ k: Int, _ tempList: inout [Int]) {
        guard let root = root else { return }

        dfs2(root.left, k, &tempList)
        tempList.append(root.val)
        if tempList.count > k {
            tempList.remove(at: 0)
        }
        dfs2(root.right, k, &tempList)
    }
}
