//
//  146. LRU 缓存机制.swift
//  LCode
//
//  Created by Z on 2021/4/6.
//

class DDLinkNode {
    let key: Int
    var val: Int
    var next: DDLinkNode?
    var pre: DDLinkNode?

    init(_ key: Int, _ val: Int) {
        self.key = key
        self.val = val
    }
}

class LRUCache_146_ {
    let head: DDLinkNode
    let tail: DDLinkNode
    let capacity: Int
    var nodeMap: [Int: DDLinkNode] = [:]
    var count = 0

    init(_ capacity: Int) {
        self.capacity = capacity
        self.head = DDLinkNode(0, 0)
        self.tail = DDLinkNode(0, 0)
        head.next = tail
        tail.pre = head
    }

    func get(_ key: Int) -> Int {
        guard let node = nodeMap[key] else { return -1 }
        deleteNode(node)
        insetNode(node)
        return node.val
    }

    func put(_ key: Int, _ value: Int) {
        var node = nodeMap[key]
        if node == nil {
            node = DDLinkNode(key, value)
            count += 1
        }
        node?.val = value
        nodeMap[key] = node
        deleteNode(node)
        insetNode(node)
        if count > capacity {
            removeLast()
        }
    }

    func removeLast() {
        count -= 1
        var node = tail.pre
        nodeMap[node!.key] = nil
        node?.next?.pre = node?.pre
        node?.pre?.next = node?.next
        node = nil
    }

    func insetNode(_ node: DDLinkNode?) {
        head.next?.pre = node
        node?.next = head.next
        node?.pre = head
        head.next = node
    }

    func deleteNode(_ node: DDLinkNode?) {
        node?.pre?.next = node?.next
        node?.next?.pre = node?.pre
        node?.pre = nil
        node?.next = nil
    }
}
