//
//  92. 反转链表 II2刷.swift
//  LCode
//
//  Created by Z on 2021/3/19.
//

class Solution_92 {
    // 空间复杂度 O(n)
    // 时间复杂度 O(1)
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        // 创建一个虚拟节点在头部
        let dummyNode = ListNode(0, head)
        // 记录开始反转节点的前一个节点
        var leftNode = dummyNode
        for _ in 1 ..< left {
            leftNode = leftNode.next!
        }
        // 开始反转节点
        let curNode = leftNode.next
        // leftNode 的 下一个节点
        var nextNode: ListNode?
        for _ in left ..< right {
            // 获取 leftNode 的下一个节点
            nextNode = curNode!.next
            // 记录下一轮 leftNode 的下一个节点
            curNode?.next = nextNode?.next
            // 将之前的 leftNode 的下一个节点 赋值给 新的 leftNode 的下一个节点的节点
            nextNode?.next = leftNode.next
            // 给 leftNode 的下一个节点 赋新值
            leftNode.next = nextNode
        }

        return dummyNode.next
    }

//    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
//        if left == right {
//            return head
//        }
//
//        var nextNode: ListNode?
//        var dummryNode = ListNode(0, head)
//        var hairNode = dummryNode
//        var head = head
//        var count = 1
//        while head != nil {
//            if count < left {
//                hairNode = head!
//                head = head?.next
//            } else if count == left {
//                nextNode = head?.next?.next
//                hairNode.next = head?.next
//                hairNode.next?.next = head
//                head = nextNode
//            } else if count < right {
//                nextNode = head?.next
//                let aN = hairNode.next
//                hairNode.next = head
//                hairNode.next?.next = aN
//                head = nextNode
//
//            } else if count == right {
//            } else {}
//
    ////            if left == count {
    ////                currentNode.next = head?.next
    ////            }
    ////
//        }
//
//        return nil
//    }
}
