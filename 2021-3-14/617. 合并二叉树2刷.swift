//
//  617. 合并二叉树2刷.swift
//  LCode
//
//  Created by Z on 2021/3/14.
//

class Solution_617_2 {
    // 时间复杂度O(n)  n 是节点数最小的那个
    // 空间复杂度O(n)  n 是节点数最小的那个
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        guard let root1 = root1 else { return root2 }
        guard let root2 = root2 else { return root1 }
        
        let val = root1.val + root2.val
        let node = TreeNode(val)
        node.left = mergeTrees(root1.left, root2.left)
        node.right = mergeTrees(root1.right, root2.right)
        
        return node
    }
    
    // 时间复杂度O(n)  n 是节点数最小的那个
    // 空间复杂度O(n)  n 是节点数最小的那个
    func mergeTrees2(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        guard let root1 = root1 else { return root2 }
        guard let root2 = root2 else { return root1 }
        let root = TreeNode(root1.val + root2.val)
        
        var list = [root]
        var list1 = [root1]
        var list2 = [root2]
        while !list.isEmpty || !list2.isEmpty {
            let node = list.removeFirst()
            let node1 = list1.removeFirst()
            let node2 = list2.removeFirst()
            
            if node1.left != nil, node2.left != nil {
                node.left = TreeNode(node1.left!.val + node2.left!.val)
                list.append(node.left!)
                list1.append(node1.left!)
                list2.append(node2.left!)
                
            } else if node1.left != nil {
                node.left = node1.left
            } else {
                node.left = node2.left
            }
            
            if node1.right != nil, node2.right != nil {
                node.right = TreeNode(node1.right!.val + node2.right!.val)
                list.append(node.right!)
                list1.append(node1.right!)
                list2.append(node2.right!)
                
            } else if node1.right != nil {
                node.right = node1.right
            } else {
                node.right = node2.right
            }
        }
        
        return root
    }
}
