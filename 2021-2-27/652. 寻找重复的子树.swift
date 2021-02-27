//
//  652. 寻找重复的子树.swift
//  LCode
//
//  Created by Z on 2021/2/27.
//

class Solution652 {
    // https://leetcode-cn.com/problems/find-duplicate-subtrees/
    // 子树：以某个节点为根节点和该节点下面所有的节点组成的树
    //
    // 重复的子树
    // 把树的每个子树都存在 map 中，第二次出现就记录。
    // 怎么存，还能判断是否出现过  要序列化。把序列化的数据作为 key 出现次数作为 value
    
    // 时间复杂度 O(n)  每个节点访问一次
    // 空间复杂度 O(n)  n 个树
    
    var serMap: [String: Int] = [:]
    var ans: [TreeNode] = []
    
    func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
        _ = dfs(root)
        return ans
    }
    
    func dfs(_ root: TreeNode?) -> String {
        guard let root = root else { return "#" }
        
//        let ser = "\(root.val)" + dfs(root.left) + dfs(root.right)
        var ser = "\(root.val),"
        let left = dfs(root.left)
        let right = dfs(root.right)
        ser = ser + left + right
        if serMap[ser] == nil {
            serMap[ser] = 1
        } else {
            var s = serMap[ser]!
            s += 1
            serMap[ser] = s
            if serMap[ser] == 2 {
                ans.append(root)
            }
        }
        return ser
    }
}
