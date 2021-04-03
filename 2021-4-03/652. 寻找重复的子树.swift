//
//  652. 寻找重复的子树.swift
//  LCode
//
//  Created by Z on 2021/4/3.
//

class Solution_652 {
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    var ans: [TreeNode] = []
    var strMap: [String: Int] = [:]
    func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
        _ = dfs(root)
        return ans
    }

    func dfs(_ root: TreeNode?) -> String {
        guard let root = root else { return "#" }

        let str = "N\(root.val)" + "L\(dfs(root.left))" + "R\(dfs(root.right))"
        let count = (strMap[str] ?? 0) + 1
        strMap[str] = count
        if count == 2 {
            ans.append(root)
        }

        return str
    }
}
