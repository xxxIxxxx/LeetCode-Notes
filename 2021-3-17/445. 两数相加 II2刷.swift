//
//  445. 两数相加 II2刷.swift
//  LCode
//
//  Created by Z on 2021/3/17.
//

class Solution_445 {
    // 时间复杂度O(n) n 为长度最长的链表的节点数
    // 时间复杂度O(m+n) m n 为两个链表的节点数
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil { return l2 }
        if l2 == nil { return l1 }
        var list1: [ListNode] = [], list2: [ListNode] = [], node1 = l1, node2 = l2
        while node1 != nil || node2 != nil {
            if node1 != nil { list1.append(node1!) }
            if node2 != nil { list2.append(node2!) }
            node1 = node1?.next
            node2 = node2?.next
        }
        
        var isAdd = false
        let node = ListNode(0)
        
        while !list1.isEmpty || !list2.isEmpty {
            let n1 = list1.popLast()
            let n2 = list2.popLast()
            var val = (n1?.val ?? 0) + (n2?.val ?? 0)
            if isAdd {
                val += 1
                isAdd = false
            }
            if val >= 10 {
                isAdd = true
                val = val - 10
            }
            let nextNode = node.next
            node.next = ListNode(val, nextNode)
        }
        if isAdd {
            return ListNode(1, node.next)
        }
        
        return node.next
    }
}
