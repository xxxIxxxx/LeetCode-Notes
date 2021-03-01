function ListNode(val) {
    this.val = val;
    this.next = null;
}

// https://leetcode-cn.com/problems/linked-list-cycle-lcci/

// 快慢指针法
// 解释： https://leetcode-cn.com/problems/linked-list-cycle-lcci/solution/kuai-man-zhi-zhen-zheng-ming-bi-jiao-yan-jin-by-ch/
//
// 时间复杂度 O(n) 其中 N 为链表中节点的数目。在最初判断快慢指针是否相遇时, 
// slow 指针走过的长度不超过链表总长度。随后寻找入环点时，走过的距离也不会超过链表的总长度。
// 因此，总的执行时间为 O(n) + O(n) = O(n)

// 空间复杂度 O(1) 只使用了 fast slow 两个指针

// 记住一点：
// 快慢指针相遇点记为 P,入口点记为 C,起始点记为 A
// 则两个指针 一个从 A 出发，一个从 P 出发(P->C)  每次前进 1 步,最终会在 C 点相遇

/**
 * @param {ListNode} head
 * @return {ListNode}
 */
var detectCycle = function (head) {
    if (head == null) {
        return null
    }
    var slow = head, fast = head

    while (fast != null) {
        slow = slow.next

        if (fast.next != null) {
            fast = fast.next.next
        } else {
            return null
        }

        if (slow === fast) {

            fast = head
            while (fast != slow) {
                fast = fast.next
                slow = slow.next
            }
            return fast
        }
    }


    return null
}



//哈希表 解法
// 时间复杂度 O(n), 刚好访问了每一个节点一次
// 空间复杂度 O(n), 存储每一个访问过的节点

/**
 * @param {ListNode} head
 * @return {ListNode}
 */
var detectCycle = function (head) {
    const listMap = new Set()
    while (head != null) {
        if (listMap.has(head)) {
            return head
        } else {
            listMap.add(head)
            head = head.next
        }
    }
    return null
};
