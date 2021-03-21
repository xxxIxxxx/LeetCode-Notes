//
//  21. 合并两个有序链表2刷.swift
//  LCode
//
//  Created by Z on 2021/3/21.
//

class Solution_21 {
    // 时间复杂度O(n+m) n, m 是两个链表长度
    // 空间复杂度O(1)
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil { return l2 }
        if l2 == nil { return l1 }
        var l1 = l1, l2 = l2
        let dummyNode = ListNode()
        var cnode: ListNode? = dummyNode

        while l1 != nil || l2 != nil {
            if l1 != nil, l2 != nil {
                if l1!.val < l2!.val {
                    cnode?.next = l1
                    l1 = l1?.next
                } else {
                    cnode?.next = l2
                    l2 = l2?.next
                }
                cnode = cnode?.next
            } else if l1 != nil {
                cnode?.next = l1
            } else {
                cnode?.next = l2
            }
        }
        return dummyNode.next
    }
}
