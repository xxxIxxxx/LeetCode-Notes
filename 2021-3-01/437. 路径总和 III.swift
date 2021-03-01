//
//  437. 路径总和 III.swift
//  LCode
//
//  Created by Z on 2021/3/1.
//

// https://leetcode-cn.com/problems/path-sum-iii/
class Solution437 {
    // 双递归解法
    // 时间复杂度 O(nlogn) n 为节点数
    // 空间复杂度 O(nlogn) n 为树的深度
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        guard let root = root else { return 0 }
        
        return findSum(root, sum) + pathSum(root.left, sum) + pathSum(root.right, sum)
    }
    
    func findSum(_ root: TreeNode?, _ sum: Int) -> Int {
        guard let root = root else { return 0 }
        
        var count = 0
        
        if root.val == sum {
            count += 1
        }
        return count + findSum(root.left, sum - root.val) + findSum(root.right, sum - root.val)
    }
}

class Solution437_1 {
    // 前缀和回溯解法
//    https://leetcode-cn.com/problems/path-sum-iii/comments/808674
    // 时间复杂度 O(n)
    // 空间复杂度 O(n)
    
    // 用来存放前缀和 and 次数 key 是前缀和 value 是出现的次数
    var sumMap: [Int: Int] = [:]
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        guard let root = root else { return 0 }
        // 和为0 1次
        sumMap[0] = 1
        
        return dfs(root, 0, sum)
    }
    
    func dfs(_ root: TreeNode?, _ prefixSum: Int, _ target: Int) -> Int {
        guard let root = root else { return 0 }
        // 记录所有的满足路径和的数量
        var count = 0
        // 当前节点位置的 前缀和(包含当前节点)
        let prefixSum = prefixSum + root.val
            
        // sumMap[prefixSum - target] 有值,
        // 说明前面出现了一个节点(或多个节点) 和 当前节点 之间的 路径和 == target
        // 即满足要求所以 加上该值
        count += sumMap[prefixSum - target] ?? 0
            
        // 记录当前的 前缀和 到sunMap，并更新出现次数
        sumMap[prefixSum] = (sumMap[prefixSum] ?? 0) + 1
        // 计算左右节点
        count = count + dfs(root.left, prefixSum, target) + dfs(root.right, prefixSum, target)
        // 到这里开始返回，就是已经到底了，开始一层一层回退。
        // 但是当前的这个节点是在要回退节点的下方，（如果不去除，路径可能会是分叉的不满足要求）
        // 所以要把当前的前缀和计数 -1
        sumMap[prefixSum] = (sumMap[prefixSum] ?? 0) - 1
            
        return count
    }
}
