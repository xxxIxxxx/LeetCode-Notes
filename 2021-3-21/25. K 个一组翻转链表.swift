//
//  25. K 个一组翻转链表.swift
//  LCode
//
//  Created by Z on 2021/3/2.
//

class Solution25 {
    // 时间复杂度 O(n)
    // 空间复杂度 O(1)
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        // 虚拟头节点，始终保持头节点位置
        let dummyHead: ListNode? = ListNode(0, head)
        // 已反转部分的尾节点
        var tempTail: ListNode?
        // 待反转部分的头节点
        var nextHead: ListNode? = head

        while nextHead != nil {
            // 当前需要反转区间的头节点
            let nowhead = nextHead
            // 当前需要反转区间的尾节点
            var nowEnd: ListNode?

            for _ in 0 ..< k {
                nowEnd = nextHead
                nextHead = nextHead?.next
                if nowEnd == nil {
                    // 当前区间长度不满足 返回
                    return dummyHead?.next
                }
            }
            // 把即将反转区间的尾节点的下一节点置空
            nowEnd?.next = nil
            let rNodes = reverse(nowhead, nowEnd)
            if tempTail == nil {
                // 首次反转，更新虚拟头节点的 下一节点
                dummyHead?.next = rNodes.rHead
            }
            // 已反转部分的尾节点的.next = 当前区间反转后的头节点
            tempTail?.next = rNodes.rHead
            // 更新已反转部分的尾节点的 = 当前区间反转后的尾节点
            tempTail = rNodes.rTail
            // 连接已反转部分 与 未反转部分
            tempTail?.next = nextHead
        }

        return dummyHead?.next
    }

    /// 区间反转
    /// - Parameters:
    ///   - head: 反转前的头节点
    ///   - end: 反转前的尾节
    /// - Returns: 反转后的头节点与尾节点
    func reverse(_ head: ListNode?, _ end: ListNode?) -> (rHead: ListNode?, rTail: ListNode?) {
        var head = head

        // 反转后的尾节点
        let tail = head
        // 虚拟节点 始终保持在头位置
        let d = ListNode()
        while head != nil {
            // 反转前头节点的 next
            let oriN = d.next
            d.next = head
            head = head?.next
            d.next?.next = oriN
        }

        return (d.next, tail)
    }
}
