//
//  1382. 将二叉搜索树变平衡.swift
//  LCode
//
//  Created by Z on 2021/2/27.
//

class Solution1382 {
    // https://leetcode-cn.com/problems/balance-a-binary-search-tree/
    // 时间复杂度 O(n) 实际为 O(2n) n 为节点数 一次遍历一次构造
    // 空间复杂度 O(n) 存放节点所需的数组占用空间为节点数

    func balanceBST(_ root: TreeNode?) -> TreeNode? {
        var valList: [Int] = []
        getTreeList(root, &valList)

        return buildTree(valList, 0, valList.count - 1)
    }

    func getTreeList(_ root: TreeNode?, _ valList: inout [Int]) {
        guard let root = root else { return }

        getTreeList(root.left, &valList)
        valList.append(root.val)
        getTreeList(root.right, &valList)
    }

    func buildTree(_ valList: [Int], _ left: Int, _ right: Int) -> TreeNode? {
        if left > right {
            return nil
        }
        let mid = (right - left) / 2 + left
        let tree = TreeNode(valList[mid])
        tree.left = buildTree(valList, left, mid - 1)
        tree.right = buildTree(valList, mid + 1, right)

        return tree
    }
}
