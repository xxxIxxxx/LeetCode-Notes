//
//  25. K 个一组翻转链表.swift
//  LCode
//
//  Created by Z on 2021/4/10.
//

class Solution_25_ {
    // 时间复杂度O(n)
    // 空间复杂度O(1)
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        var head = head
        var count = 0
        let dummyNode = ListNode(0, head)

        /// 需要反转区间的头节点
        var needReverseHead: ListNode?
        /// 已经反转的尾节点
        var reversedTailNode: ListNode?

        while head != nil {
            if count == 0 {
                needReverseHead = head
            } else if count == k - 1 {
                // 记录待反转节点
                let nextNeedRHead = head?.next
                // 将即将反转区间的尾节点打断，上边已经记录
                head?.next = nil
                let r = reverse(needReverseHead, head)
                // 已经反转的尾节点 为空 说明第一次开始反转
                // 更新虚拟节点的下一节点，为第一个反转区间反转后的头节点
                if reversedTailNode == nil {
                    dummyNode.next = r.rHead
                }
                // 已反转的尾节点 连接 反转后的头节点
                reversedTailNode?.next = r.rHead
                // 更新已反转的尾节点
                reversedTailNode = r.rTail
                // 将待反转节点连接到已反转节点后
                r.rTail?.next = nextNeedRHead
                // 将反转后的尾点更新为当前节点
                head = r.rTail
                // 计数 -1
                count = -1
            }
            count += 1
            head = head?.next
        }
        return dummyNode.next
    }

    /// 反转
    /// - Parameters:
    ///   - head: 反转头
    ///   - tail: 反转尾
    /// - Returns: 反转后的头 和 尾
    func reverse(_ head: ListNode?, _ tail: ListNode?) -> (rHead: ListNode?, rTail: ListNode?) {
        let rTail = head
        var head = rTail
        let dummyNode = ListNode(0)
        while head != nil {
            let oriN = dummyNode.next
            dummyNode.next = head
            head = head?.next
            dummyNode.next?.next = oriN
        }
        return (dummyNode.next, rTail)
    }
}
