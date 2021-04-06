//
//  92. 反转链表 II.swift
//  LCode
//
//  Created by Z on 2021/4/6.
//

class Solution_92_ {
    // 时间复杂度O(n)
    // 空间复杂度O(1)
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        let addNode = ListNode(0, head)
        var cur: ListNode? = addNode
        // 反转部分的虚拟头节点
        let dummyNode = ListNode(0)
        // 反转起始节点前的那个节点
        var reversePre: ListNode?
        // 开始反转的起点
        var reverseStart: ListNode?
        var index = 0
        while true {
            if index == left - 1 {
                reversePre = cur
                reverseStart = cur?.next
            }
            if index == right + 1 {
                reversePre?.next = dummyNode.next
                reverseStart?.next = cur
                return addNode.next
            }
            if index > left - 1, index < right + 1 {
                let oriNext = dummyNode.next
                dummyNode.next = cur
                cur = cur?.next
                dummyNode.next?.next = oriNext
                if cur == nil {
                    reversePre?.next = dummyNode.next
                    return addNode.next
                }
            } else {
                cur = cur?.next
            }
            index += 1
        }
    }
}
