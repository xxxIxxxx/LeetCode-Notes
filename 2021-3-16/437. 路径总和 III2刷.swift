//
//  437. 路径总和 III2刷.swift
//  LCode
//
//  Created by Z on 2021/3/16.
//

class Solution_437 {
    // 时间复杂度O(n)
    // 空间复杂度O(n)

    // 前缀和 就是到达当前元素的路径上，之前所有元素的和。
    // 两个节点间的前缀和之差 = 目标值，则 两个节点之间存在一条路径和为目标值
    var sumMap: [Int: Int] = [:]

    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        guard let root = root else { return 0 }
        // 
        sumMap[0] = 1
        return dfs(root, 0, sum)
    }

    func dfs(_ root: TreeNode?, _ preSum: Int, _ target: Int) -> Int {
        guard let root = root else { return 0 }
        var count = 0
        // 当前节点的前缀和 包含当前节点的值
        let preSum = preSum + root.val
        // 当前节点的前缀和 - 目标值   出现在前缀和 map 中的次数
        count += sumMap[preSum - target] ?? 0
        // 更新当前 前缀和 在 map 中出现的次数
        sumMap[preSum] = (sumMap[preSum] ?? 0) + 1
        // 加左  加右
        count = count + dfs(root.left, preSum, target) + dfs(root.right, preSum, target)
        // 前序遍历 到底了 开始回退 当前的前缀和次数-1
        sumMap[preSum] = (sumMap[preSum] ?? 0) - 1

        return count
    }
}

class Solution_437_2 {
    // 时间复杂度O(nlogn)
    // 空间复杂度O(nlogn)
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        guard let root = root else { return 0 }
        return dfs(root, sum) + pathSum(root.left, sum) + pathSum(root.right, sum)
    }

    func dfs(_ root: TreeNode?, _ sum: Int) -> Int {
        guard let root = root else { return 0 }
        let nowSum = sum - root.val
        let count = (nowSum == 0) ? 1 : 0
        return count + dfs(root.left, nowSum) + dfs(root.right, nowSum)
    }
}
