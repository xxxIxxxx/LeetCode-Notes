

// 剑指 Offer 55 - II. 平衡二叉树
// https://leetcode-cn.com/problems/ping-heng-er-cha-shu-lcof/

// 时间复杂度 O(n) 最差情况下需要访问每个节点
// 空间复杂度 O(n) 最差情况下（树退化为链表时），系统递归需要使用O(N) 的栈空间。

class Solution55 {
    func isBalanced(_ root: TreeNode?) -> Bool {
        return recur(root) != -1
    }

    func recur(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        let left = recur(root.left)
        if left == -1 {
            return -1
        }
        let right = recur(root.right)
        if right == -1 {
            return -1
        }
        // 左右子树 高度差 >= 2 已经不是平衡树 返回 -1 ,退出减少访问节点
        return abs(left - right) < 2 ? max(left, right) + 1 : -1
    }
}
