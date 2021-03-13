//
//  101. 对称二叉树2刷.swift
//  LCode
//
//  Created by Z on 2021/3/13.
//

class Solution_101 {
    var ans = true
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else { return false }
        isSame(root, root)
        return ans
    }

    func isSame(_ root1: TreeNode?, _ root2: TreeNode?) {
        if ans == false || (root1 == nil && root2 == nil) {
            return
        }
        if root1?.val != root2?.val {
            ans = false
            return
        }
        isSame(root1?.left, root2?.right)
        isSame(root1?.right, root2?.left)
    }

    // 时间复杂度O(n)
    // 空间复杂度O(n)
    func isSymmetric1(_ root: TreeNode?) -> Bool {
        guard let root = root else { return false }
        return isSame1(root, root)
    }

    func isSame1(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        if root1 == nil, root2 == nil {
            return true
        }

        let r = root1?.val == root2?.val
        let left = isSame1(root1?.left, root2?.right)
        let right = isSame1(root1?.right, root2?.left)

        return r && left && right
    }

    // 时间复杂度O(n)
    // 空间复杂度O(n)
    func isSymmetric_1(_ root: TreeNode?) -> Bool {
        guard let root = root else { return false }
        var list = [root, root]

        while !list.isEmpty {
            let node1 = list.removeFirst()
            let node2 = list.removeFirst()
            if node1.val != node2.val {
                return false
            }
            if node1.left?.val != node2.right?.val {
                return false
            }
            if node1.right?.val != node2.left?.val {
                return false
            }

            if let n1l = node1.left, let n2r = node2.right {
                list.append(n1l)
                list.append(n2r)
            }
            if let n1r = node1.right, let n2l = node2.left {
                list.append(n1r)
                list.append(n2l)
            }
        }
        return true
    }

    // 时间复杂度O(n)
    // 空间复杂度 O(n)
    func isSymmetric_2(_ root: TreeNode?) -> Bool {
        guard let root = root else { return false }
        if root.left?.val != root.right?.val {
            return false
        }
        if root.left == nil {
            return true
        }

        var list = [root.left!, root.right!]

        while !list.isEmpty {
            var temp1: [TreeNode] = []
            var temp2: [TreeNode] = []
            for i in 0 ..< list.count {
                if i > list.count - i {
                    break
                }
                let node1 = list[i]
                let node2 = list[list.count - i - 1]
                if node1.val != node2.val {
                    return false
                }

                if node1.left?.val != node2.right?.val {
                    return false
                }

                if node1.right?.val != node2.left?.val {
                    return false
                }
                if let n1l = node1.left, let n2r = node2.right {
                    temp1.append(n1l)
                    temp2.insert(n2r, at: 0)
                }
                if let n1r = node1.right, let n2l = node2.left {
                    temp1.append(n1r)
                    temp2.insert(n2l, at: 0)
                }
            }
            list = temp1 + temp2
        }

        return true
    }
}
