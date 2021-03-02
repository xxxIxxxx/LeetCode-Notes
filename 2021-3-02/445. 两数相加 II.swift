//
//  445. 两数相加 II.swift
//  LCode
//
//  Created by Z on 2021/3/2.
//

class Solution445 {
    // https://leetcode-cn.com/problems/add-two-numbers-ii/
    // 时间复杂度 O(max(m,n)) m n 是两个链表的长度
    // 空间复杂度 O(m + n)
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil { return l2 }
        if l2 == nil { return l1 }
        
        var l1 = l1, l2 = l2, l1List: [Int] = [], l2List: [Int] = []
        
        while l1 != nil || l2 != nil {
            if l1 != nil {
                l1List.append(l1!.val)
                l1 = l1?.next
            }
            
            if l2 != nil {
                l2List.append(l2!.val)
                l2 = l2?.next
            }
        }
        
        var isAdd = false, listNode: ListNode?
        
        while !l1List.isEmpty || !l2List.isEmpty {
            var val = (l1List.popLast() ?? 0) + (l2List.popLast() ?? 0)
            if isAdd {
                val += 1
                isAdd = false
            }
            if val >= 10 {
                isAdd = true
                val = val % 10
            }
            let listN = ListNode(val, listNode)
            listNode = listN
        }
        
        // 最后存在进位的情况
        if isAdd {
            listNode = ListNode(1, listNode)
        }
        
        return listNode
    }
}
