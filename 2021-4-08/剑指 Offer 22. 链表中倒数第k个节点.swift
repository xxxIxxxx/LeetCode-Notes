//
//  剑指 Offer 22. 链表中倒数第k个节点.swift
//  LCode
//
//  Created by Z on 2021/4/8.
//

class Solution_22_ {
    // 时间复杂度O(n)
    // 空间复杂度O(1)
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        var fast = head
        var slow = head
        var count = k

        while fast != nil {
            fast = fast?.next
            if count < 1 {
                slow = slow?.next
            }
            count -= 1
        }
        return slow
    }
}
