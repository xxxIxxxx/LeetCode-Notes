//
//  101. 对称二叉树.swift
//  LCode
//
//  Created by Z on 2021/4/1.
//

class Solution_101_A {
    // bfs
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    func isSymmetric(_ root: TreeNode?) -> Bool {
        if root?.left?.val != root?.right?.val {
            return false
        }
        guard let left = root?.left, let right = root?.right else { return true }

        var lStack = [left]
        var rStack = [right]
        while !lStack.isEmpty {
            let count = lStack.count

            for _ in 0 ..< count {
                let lNode = lStack.remove(at: 0)
                let rNode = rStack.removeLast()
                if lNode.val != rNode.val {
                    return false
                }

                if lNode.left != nil, rNode.right != nil {
                    lStack.append(lNode.left!)
                    rStack.insert(rNode.right!, at: 0)
                } else if lNode.left != nil || rNode.right != nil {
                    return false
                }

                if lNode.right != nil, rNode.left != nil {
                    lStack.append(lNode.right!)
                    rStack.insert(rNode.left!, at: 0)
                } else if lNode.right != nil || rNode.left != nil {
                    return false
                }
            }
        }
        return true
    }

    // dfs
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    func isSymmetric2(_ root: TreeNode?) -> Bool {
        return isSame(root?.left, root?.right)
    }

    func isSame(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        if root1?.val != root2?.val {
            return false
        }
        if root1?.val == nil, root2?.val == nil {
            return true
        }
//        let left = isSame(root1?.left, root2?.right)
//        let right = isSame(root1?.right, root2?.left)

//        return left && right
        return isSame(root1?.left, root2?.right) && isSame(root1?.right, root2?.left)
    }
}
