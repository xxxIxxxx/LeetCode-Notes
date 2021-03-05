//
//  92. 反转链表 II.swift
//  LCode
//
//  Created by Z on 2021/3/4.
//

class Solution92 {
    // https://leetcode-cn.com/problems/reverse-linked-list-ii/
    // 时间复杂度O(n)
    // 空间复杂度O(1)
    
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        /// 创建一个虚拟节点
        let dummyNode = ListNode(0, head)
        
        /// 需要反转的起始节点的左边节点
        var leftNode = dummyNode
        
        // 注意区间
        for _ in 0 ..< left - 1 {
            leftNode = leftNode.next!
        }
        
        /// 需要反转的节点起始节点
        let headNode = leftNode.next
        /// 需要反转的节点终点
        var tailNode = leftNode
        
        // 注意区间
        for _ in left ... right {
            tailNode = tailNode.next!
        }
        
        /// 需要反转节点的终点的 右边节点
        let rightNode = tailNode.next
        
        // 将需要反转节点的前边和后边打断
        leftNode.next = nil
        tailNode.next = nil
        
        // 开始反转
        var preNode: ListNode?
        var cur = headNode
        
        while cur != nil {
            let next = cur?.next
            cur?.next = preNode
            preNode = cur
            cur = next
        }
        // 反转后 左边节点应该指向 之前的尾
        leftNode.next = tailNode
        // 之前的头 应该指向右
        headNode?.next = rightNode
        // 添加虚拟节点的下一个
        return dummyNode.next
    }
    
    // 时间复杂度O(n)
    // 空间复杂度O(1)
    func reverseBetween2(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        let dummyNode = ListNode(0, head)
        /// 反转起始节点左边的节点
        var leftNode = dummyNode
        
        for _ in 0 ..< left - 1 {
            leftNode = leftNode.next!
        }
        
        let curNode = leftNode.next
        var nextNode: ListNode?
        
        for _ in left ... right {
            nextNode = curNode?.next
            curNode?.next = nextNode?.next
            nextNode?.next = leftNode.next
            leftNode.next = nextNode
        }
        
        return dummyNode.next
    }
}
