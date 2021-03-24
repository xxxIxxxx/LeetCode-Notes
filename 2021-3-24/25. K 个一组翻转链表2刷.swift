//
//  25. K 个一组翻转链表2刷.swift
//  LCode
//
//  Created by Z on 2021/3/24.
//

class Solution_25 {
    // 时间复杂度O(n)
    // 空间复杂度O(1)
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        // 整个链的虚拟节点始终保持在头部
        let dummyNode = ListNode(0, head)
        var cur = head
        // 已反转部分的尾节点
        var tailNode: ListNode?

        while cur != nil {
            // 当前需要反转区间的头节点
            let kHead = cur
            // 当前需要反转区间的尾节点
            var kTail: ListNode?
            for _ in 0 ..< k {
                kTail = cur
                if kTail == nil {
                    return dummyNode.next
                }
                cur = cur?.next
            }
            kTail?.next = nil
            let res = reverse(kHead, kTail)
            if tailNode == nil {
                // 第一次反转 更新虚拟节点
                dummyNode.next = res.rHead
            }
            tailNode?.next = res.rHead
            tailNode = res.rTail
            // 将已反转部分 与 未反转部分连接
            tailNode?.next = cur
        }
        return dummyNode.next
    }

    func reverse(_ head: ListNode?, _ tail: ListNode?) -> (rHead: ListNode?, rTail: ListNode?) {
        let rTail = head
        let dummyNode = ListNode()
        var head = head
        while head != nil {
            let lastN = dummyNode.next
            dummyNode.next = head
            head = head?.next
            dummyNode.next?.next = lastN
        }

        return (dummyNode.next, rTail)
    }
}
