//
//  21. 合并两个有序链表.swift
//  LCode
//
//  Created by Z on 2021/4/7.
//

class Solution_21_ {
    // 时间复杂度O(m + n) m n 为 两个链表的节点数
    // 空间复杂度O(1)
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let _ = l1 else { return l2 }
        guard let _ = l2 else { return l1 }

        var l1 = l1, l2 = l2

        let dummyNode = ListNode(0)
        var node: ListNode? = dummyNode
        while l1 != nil, l2 != nil {
            if l1!.val < l2!.val {
                node?.next = l1
                l1 = l1?.next
            } else {
                node?.next = l2
                l2 = l2?.next
            }
            node = node?.next
        }
        node?.next = l1
        if l2 != nil {
            node?.next = l2
        }
        return dummyNode.next
    }
}
