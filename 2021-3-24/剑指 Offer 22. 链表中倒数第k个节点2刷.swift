//
//  剑指 Offer 22. 链表中倒数第k个节点2刷.swift
//  LCode
//
//  Created by Z on 2021/3/24.
//

class Solution22_2 {
    // 时间复杂度O(n)
    // 空间复杂度O(1)
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        var slow = head
        var fast = head
        for _ in 0 ..< k {
            fast = fast?.next
        }
        while fast != nil {
            fast = fast?.next
            slow = slow?.next
        }
        return slow
    }

    // 时间复杂度O(n)
    // 空间复杂度O(n)
    func getKthFromEnd1(_ head: ListNode?, _ k: Int) -> ListNode? {
        var nodeMap: [Int: ListNode] = [:]
        var node = head
        var index = 0

        while node != nil {
            nodeMap[index] = node
            index += 1
            node = node?.next
        }

        return nodeMap[index - k]
    }
}
