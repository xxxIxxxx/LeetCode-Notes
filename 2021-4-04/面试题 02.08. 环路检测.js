//
//  面试题 02.08. 环路检测.js
//  LCode
//
//  Created by Z on 2021/4/4.
//

function ListNode(val) {
    this.val = val
    this.next = null
}

/**
 * @param {ListNode} head
 * @return {ListNode}
 */
var detectCycle = function (head) {
    // 时间复杂度O(n)
    // 空间复杂度O(1)
    var slow = head
    var fast = head
    while (fast != null) {
        slow = slow.next
        if (fast.next != null) {
            fast = fast.next.next
        } else {
            return null
        }

        if (fast === slow) {
            fast = head
            while (fast !== slow) {
                fast = fast.next
                slow = slow.next
            }
            return fast
        }


    }
    return null
}
