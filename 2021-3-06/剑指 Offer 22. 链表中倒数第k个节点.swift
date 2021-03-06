//
//  剑指 Offer 22. 链表中倒数第k个节点.swift
//  LCode
//
//  Created by Z on 2021/3/6.
//

class Solution_22 {
    // https://leetcode-cn.com/problems/lian-biao-zhong-dao-shu-di-kge-jie-dian-lcof/
    // 时间复杂度O(n)
    // 空间复杂度O(n)

    
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        var nodeMap: [Int: ListNode] = [:]
        var index = 1

        var head = head
        while head != nil {
            nodeMap[index] = head
            head = head?.next
            index += 1
        }

        return nodeMap[index - k]
    }
}
