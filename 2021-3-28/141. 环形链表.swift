//
//  141. 环形链表.swift
//  LCode
//
//  Created by Z on 2021/3/28.
//

class Solution141 {
    // 时间复杂度O(n)
    // 空间复杂度O(1)
    func hasCycle(_ head: ListNode?) -> Bool {
        var fastNode = head?.next
        var slowNode = head
        while fastNode != nil {
            if fastNode === slowNode {
                return true
            }
            fastNode = fastNode?.next?.next
            slowNode = slowNode?.next
        }

        return false
    }
}
