//
//  206. 反转链表.swift
//  LCode
//
//  Created by Z on 2021/4/5.
//

class Solution_206_ {
    // 时间复杂度O(n)
    // 空间复杂度O(1)
    func reverseList(_ head: ListNode?) -> ListNode? {
        let dummyNode = ListNode(0)
        var head = head

        while head != nil {
            let lastNextNode = dummyNode.next
            dummyNode.next = head
            head = head?.next
            dummyNode.next?.next = lastNextNode
        }
        return dummyNode.next
    }
}
