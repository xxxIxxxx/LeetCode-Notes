//
//  21. 合并两个有序链表.swift
//  LCode
//
//  Created by Z on 2021/3/5.
//

class Solution21 {
    // https://leetcode-cn.com/problems/merge-two-sorted-lists/
    // 时间复杂度O(n) n 为长度短的那个链表的长度
    // 空间复杂度O(1)
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil { return l2 }
        if l2 == nil { return l1 }
        var l1 = l1, l2 = l2

        let dummyNode = ListNode(0)
        var tempNode: ListNode? = dummyNode

        while l1 != nil, l2 != nil {
            if l1!.val >= l2!.val {
                tempNode?.next = l2
                l2 = l2?.next
            } else {
                tempNode?.next = l1
                l1 = l1?.next
            }
            tempNode = tempNode?.next
        }

        if l1 == nil {
            tempNode?.next = l2
        } else {
            tempNode?.next = l1
        }

        return dummyNode.next
    }
}
