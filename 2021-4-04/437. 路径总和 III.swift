//
//  437. 路径总和 III.swift
//  LCode
//
//  Created by Z on 2021/4/4.
//

class Solution_437_ {
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    var sumMap: [Int: Int] = [:]
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        sumMap[0] = 1
        return dfs(root, 0, sum)
    }
    
    func dfs(_ root: TreeNode?, _ preSum: Int, _ target: Int) -> Int {
        guard let root = root else { return 0 }
        let curP = root.val + preSum
        var count = (sumMap[curP - target] ?? 0)
        sumMap[curP] = (sumMap[curP] ?? 0) + 1
        count = count + dfs(root.left, curP, target) + dfs(root.right, curP, target)
        sumMap[curP] = (sumMap[curP] ?? 0) - 1
        return count
    }
    
    // 时间复杂度O(nlogn)
    // 空间复杂度O(n)
    func pathSum2(_ root: TreeNode?, _ sum: Int) -> Int {
        guard let root = root else { return 0 }
        return dfs2(root, sum) + pathSum2(root.left, sum) + pathSum2(root.right, sum)
    }
    
    func dfs2(_ root: TreeNode?, _ sum: Int) -> Int {
        guard let root = root else { return 0 }
        
        let sum = sum - root.val
        var count = 0
        
        if sum == 0 {
            count += 1
        }
        
        return count + dfs2(root.left, sum) + dfs2(root.right, sum)
    }
}
