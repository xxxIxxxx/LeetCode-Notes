//
//  146. LRU 缓存机制2刷.swift
//  LCode
//
//  Created by Z on 2021/3/19.
//

class DLinkNode {
    let key: Int
    var val: Int
    var pre: DLinkNode?
    var next: DLinkNode?

    init(_ key: Int, _ val: Int) {
        self.key = key
        self.val = val
    }
}

class LRUCache_146 {
    var cacheMap: [Int: DLinkNode] = [:]
    var capacity = 0
    var currentCount = 0

    var headNode = DLinkNode(0, 0)
    var tailNode = DLinkNode(0, 0)

    init(_ capacity: Int) {
        self.capacity = capacity
        headNode.next = tailNode
        tailNode.pre = headNode
    }

    func get(_ key: Int) -> Int {
        if let value = cacheMap[key] {
            deleteNode(value)
            insetHead(value)
            return value.val
        }
        return -1
    }

    func put(_ key: Int, _ value: Int) {
        let newValue = DLinkNode(key, value)
        if let oldValue = cacheMap[key] {
            deleteNode(oldValue)
            insetHead(newValue)
        } else {
            insetHead(newValue)
        }
    }

    func deleteNode(_ node: DLinkNode) {
        let p = node.pre
        let n = node.next
        p?.next = n
        n?.pre = p
        cacheMap[node.key] = nil
        currentCount -= 1
    }

    func insetHead(_ node: DLinkNode) {
        if currentCount == capacity {
            deleteTail()
        }
        let n = headNode.next
        headNode.next = node
        node.pre = headNode
        node.next = n
        n?.pre = node
        cacheMap[node.key] = node
        currentCount += 1
    }

    func deleteTail() {
        if let key = tailNode.pre?.key {
            cacheMap[key] = nil
        }
        let p = tailNode.pre?.pre
        p?.next = tailNode
        tailNode.pre = p
        currentCount -= 1
    }
}
