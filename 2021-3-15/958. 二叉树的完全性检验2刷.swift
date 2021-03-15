//
//  958. 二叉树的完全性检验2刷.swift
//  LCode
//
//  Created by Z on 2021/3/15.
//

class Solution_958 {
    // 思路 需满足两点
    // 1.当前层出现空节点 那么当前层后续不能再出现空节点，否则不满足。
    // 2.当前层未充满，那么不应该再有下一层节点， 否则不满足

    // 时间复杂度O(n)
    // 空间复杂度O(n)
    func isCompleteTree(_ root: TreeNode?) -> Bool {
        guard let root = root else { return false }

        var list = [root]
        // 上一层是否全满
        var isFull = true
        // 当前层
        var d = 0

        while !list.isEmpty {
            let count = list.count
            // 当前层已经出现了空节点 当前层后续不能再出现空节点了
            var isShouldNoMore = false
            for _ in 0 ..< count {
                let node = list.removeFirst()

                if node.left != nil {
                    if isShouldNoMore {
                        return false
                    }
                    list.append(node.left!)
                } else {
                    isShouldNoMore = true
                }

                if node.right != nil {
                    if isShouldNoMore {
                        return false
                    }
                    list.append(node.right!)
                } else {
                    isShouldNoMore = true
                }
            }

            if !isFull, !list.isEmpty {
                return false
            }
            d += 1
            isFull = list.count == (1 << d)
        }

        return true
    }
}
