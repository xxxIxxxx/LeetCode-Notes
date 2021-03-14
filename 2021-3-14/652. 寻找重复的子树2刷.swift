//
//  652. 寻找重复的子树2刷.swift
//  LCode
//
//  Created by Z on 2021/3/14.
//

class Solution_652_2 {
    // 时间复杂度O(n^2)  其中N 是二叉树上节点的数量 。 遍历所有节点，在每个节点处序列化需要时间O(N)。
    // 空间复杂度O(n^2) nodeStrMap 的大小
    var ansList: [TreeNode] = []
    var nodeStrMap: [String: Int] = [:]
    
    func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
        _ = dfs(root)
        return ansList
    }
    
    func dfs(_ root: TreeNode?) -> String {
        guard let root = root else { return "#" }
        
        let l = dfs(root.left)
        let r = dfs(root.right)
        
        let str = "R\(root.val)" + "L\(l)" + "R\(r)"
        var count = nodeStrMap[str] ?? 0
        
        if count == 0 {
            nodeStrMap[str] = 1
        } else {
            count += 1
            if count == 2 {
                ansList.append(root)
            }
            nodeStrMap[str] = count
        }
        
        return str
    }
}
