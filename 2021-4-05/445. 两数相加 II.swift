//
//  445. 两数相加 II.swift
//  LCode
//
//  Created by Z on 2021/4/5.
//

class Solution_445_ {
    // 时间复杂度O(n) 两次遍历每次时长都是长的节点数
    // 空间复杂度O(a+b) 两个链的节点数
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1, l2 = l2
        
        var list1: [ListNode] = [], list2: [ListNode] = []
        
        while l1 != nil || l2 != nil {
            if l1 != nil {
                list1.append(l1!)
                l1 = l1?.next
            }
            if l2 != nil {
                list2.append(l2!)
                l2 = l2?.next
            }
        }
        
        var isAdd = false
        var nextNode: ListNode?
        
        while !list1.isEmpty || !list2.isEmpty {
            var val = (list1.popLast()?.val ?? 0) + (list2.popLast()?.val ?? 0)
            if isAdd {
                val += 1
                isAdd = false
            }
            if val >= 10 {
                val = val - 10
                isAdd = true
            }
            let node = ListNode(val)
            node.next = nextNode
            nextNode = node
        }
        if isAdd {
            return ListNode(1, nextNode)
        }
        return nextNode
    }
}
