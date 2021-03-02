//
//  206. 反转链表.swift
//  LCode
//
//  Created by Z on 2021/3/2.
//

class Solution206 {
    
    // https://leetcode-cn.com/problems/reverse-linked-list/
    // 题解 https://leetcode-cn.com/problems/reverse-linked-list/solution/shi-pin-jiang-jie-die-dai-he-di-gui-hen-hswxy/
    
    // 迭代法
    // 时间复杂度 O(n)
    // 空间复杂度 O(1)
    func reverseList1(_ head: ListNode?) -> ListNode? {
        // 上一个节点
        var prev: ListNode?
        // 当前节点
        var curr = head

        while curr != nil {
            // 记录当前节点的下一个节点
            let next = curr?.next
            // 当前节点指向上一个节点
            curr?.next = prev
            // 把上一个节点更新为当前节点
            prev = curr
            // 把当前节点 更新为下一个节点
            curr = next
        }
        return prev
    }
    
    // 递归
    // 时间复杂度O(n)
    // 空间复杂度O(n) 递归栈的空间
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }

        let ans = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        
        return ans
    }
}
