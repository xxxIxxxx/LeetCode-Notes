//
//  105. 从前序与中序遍历序列构造二叉树.swift
//  LCode
//
//  Created by Z on 2021/3/31.
//

class Solution_105 {
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    /*
     前序遍历 Root Left Right
     中序遍历 Left Root Right
     
     根据前序遍历的第一个节点为根结点可以将 中序遍历分成两部分 LTree根节点的左子树 和 RTree根节点的右子树
     根据 LTree 的长度可以在 前行遍历中将 LTree 的前序遍历部分找出， 那剩下的就是 RTree的前序遍历部分
     将 LTree RTree 分别看成一个新的 Tree，循环这个操作。
     直到 LTree 长度为0 RTree 长度为0
     */
    
    var valMap: [Int: Int] = [:]
    
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.isEmpty {
            return nil
        }
        
        // 每次从 中序遍历中查找 root.val  index 都很耗时，所以先遍历一边把 index 和 val 用 map 存起来，后续查找时间就是 O(1)
        for (index, val) in inorder.enumerated() {
            valMap[val] = index
        }
        
        let rootVal = preorder[0]
        let root = TreeNode(rootVal)
//        let inorderRootIndex = inorder.firstIndex(of: rootVal)!
        let inorderRootIndex = valMap[rootVal]!
        let inorderLeftCount = inorderRootIndex
        
        root.left = buildSubTree(preorder, inorder, 1, 1 + inorderLeftCount, 0, inorderRootIndex)
        root.right = buildSubTree(preorder, inorder, 1 + inorderLeftCount, preorder.count, inorderRootIndex + 1, preorder.count)
        return root
    }

    func buildSubTree(_ preorder: [Int], _ inorder: [Int], _ preorderHead: Int, _ preorderTail: Int, _ inorderHead: Int, _ inorderTail: Int) -> TreeNode? {
        if preorderHead >= preorderTail {
            return nil
        }
        
        let rootVal = preorder[preorderHead]
        let root = TreeNode(rootVal)
//        let inorderRootIndex = inorder.firstIndex(of: rootVal)!
        let inorderRootIndex = valMap[rootVal]!
        let inorderLeftCount = inorderRootIndex - inorderHead
        let preorderLeftIndex = preorderHead + 1
        
        root.left = buildSubTree(preorder, inorder, preorderLeftIndex, preorderLeftIndex + inorderLeftCount, inorderHead, inorderRootIndex)
        
        root.right = buildSubTree(preorder, inorder, preorderLeftIndex + inorderLeftCount, preorderTail, inorderRootIndex + 1, inorderTail)
        
        return root
    }
}
