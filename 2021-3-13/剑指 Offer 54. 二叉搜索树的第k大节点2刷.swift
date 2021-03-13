//
//  剑指 Offer 54. 二叉搜索树的第k大节点2刷.swift
//  LCode
//
//  Created by Z on 2021/3/13.
//

class Solution_54_2 {
    // 搜索二叉树特点
    // 左节点 < root < 右节点
    // 所有大数都在右节点
    // 那么最大数是最底层最右节点
    // 遍历顺序 先右 再root 最后左
    // 即中序遍历变形

    
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    var ans: Int?
    var k = 0
    func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
        self.k = k
        dfs(root)
        return ans!
    }

    func dfs(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        dfs(root.right)
        k -= 1
        if k == 0 {
            ans = root.val
        }
        if ans != nil {
            return
        }
        dfs(root.left)
    }
    
    // 时间复杂度O(n)
    // 空间复杂度O(n)
//    var ans: Int?
//    var k = 0
//    func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
//        guard let root = root else { return 0 }
//        self.k = k
//        var d = 0
//        dfs(root, &d)
//        return ans!
//    }
//
//    func dfs(_ root: TreeNode?, _ d: inout Int) {
//        guard let root = root else {
//            return
//        }
//        dfs(root.right, &d)
//        d += 1
//        if d == k {
//            ans = root.val
//        }
//        if ans != nil {
//            return
//        }
//        dfs(root.left, &d)
//    }
}
