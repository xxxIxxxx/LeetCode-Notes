//
//  105. 从前序与中序遍历序列构造二叉树.swift
//  LCode
//
//  Created by Z on 2021/3/10.
//

class Solution105 {
    // 时间复杂度O(n)
    // 空间复杂度O(n)

    var inorderMap: [Int: Int] = [:]
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        for (index, val) in inorder.enumerated() {
            inorderMap[val] = index
        }
        let count = inorder.count

        return builderTree(preorder, inorder, 0, count - 1, 0, count - 1)
    }

    /// 构造树
    /// - Parameters:
    ///   - preorder: 前序遍历原数组
    ///   - inorder: 中序遍历原数组
    ///   - preStart: 前序遍历取值区间起点
    ///   - preEnd: 前序遍历取值区间终点
    ///   - inoStart: 中序遍历取值区间起点
    ///   - inoEnd: 中序遍历取值区间终点
    /// - Returns: 当前根节点
    func builderTree(_ preorder: [Int], _ inorder: [Int], _ preStart: Int, _ preEnd: Int, _ inoStart: Int, _ inoEnd: Int) -> TreeNode? {
        // 因为是取值区间可以等，相交返回 nil
        if preStart > preEnd {
            return nil
        }

        // 前序遍历根节点的位置
        let preRootIndex = preStart
        // 根节点值
        let rootVal = preorder[preRootIndex]

        // 根节点在中序遍历中的位置
        let inRootIndex = inorderMap[rootVal]!
        // 根节点左子树所有的节点长度
        let leftTreeCount = inRootIndex - inoStart

        // 创建根节点
        let root = TreeNode(rootVal)
        // 当前根节点左子树区间
        // 前序遍历的区间是 [preRootIndex + 1(根节点下标+1)  到 preStart + leftTreeCount(左子树起点+左子树长度)]
        // 中序遍历的区间是 [inoStart (中序遍历起点)  到 inRootIndex - 1(根节点下标 - 1)]
        root.left = builderTree(preorder, inorder, preRootIndex + 1, preStart + leftTreeCount, inoStart, inRootIndex - 1)

        // 当前根节点右子树区间
        // 前序遍历的区间是 [preRootIndex + 1 + leftTreeCount(根节点下标+1+左子树长度)  到 preEnd(前序遍历终点)]
        // 中序遍历的区间是 [inRootIndex + 1 (根节点下标+1)  到 inoEnd(中序遍历终点)]
        root.right = builderTree(preorder, inorder, preRootIndex + 1 + leftTreeCount, preEnd, inRootIndex + 1, inoEnd)

        return root
    }
}

// 时间复杂度O(n)
// 空间复杂度O(n)
func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    if preorder.count < 1, inorder.count < 1 {
        return nil
    }

    let rootVal = preorder[0]

    let root = TreeNode(rootVal)
    let rootIndex = inorder.firstIndex(of: rootVal)!

    let inLeftList = inorder[0 ..< rootIndex]
    let inRightList = inorder[rootIndex + 1 ..< inorder.endIndex]

    let prLeftList = preorder[1 ..< 1 + inLeftList.count]
    let prRightList = preorder[1 + prLeftList.count ..< preorder.endIndex]

    root.left = buildTree(Array(prLeftList), Array(inLeftList))
    root.right = buildTree(Array(prRightList), Array(inRightList))

    return root
}
