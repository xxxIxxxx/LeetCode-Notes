//
//  206. 反转链表2刷.swift
//  LCode
//
//  Created by Z on 2021/3/17.
//

class Solution_206 {
    // 时间复杂度O(n)
    // 空间复杂度O(1)
    func reverseList(_ head: ListNode?) -> ListNode? {
        let dummryNode = ListNode()
        var curNode = head

        while curNode != nil {
            let node = dummryNode.next
            dummryNode.next = curNode
            curNode = curNode?.next
            dummryNode.next?.next = node
        }

        return dummryNode.next
    }
}
