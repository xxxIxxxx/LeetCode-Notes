//
//  146. LRU 缓存机制.swift
//  LCode
//
//  Created by Z on 2021/3/3.
//

// https://leetcode-cn.com/problems/lru-cache/

/// 双向链表
class DLinkedNode {
    /// key
    let key: Int
    /// value
    var val: Int
    /// 上一个
    var pre: DLinkedNode?
    /// 下一个
    var next: DLinkedNode?

    init(_ key: Int, val: Int) {
        self.key = key
        self.val = val
    }
}

class LRUCache {
    /// 存储空间
    var capacity: Int
    /// O(1) 读取时间的 字典
    var nodeMap: [Int: DLinkedNode] = [:]
    /// 双向链表的头部
    var head = DLinkedNode(0, val: 0)
    /// 双向链表的尾部
    var tail = DLinkedNode(0, val: 0)
    /// 已经存储的长度
    var count = 0

    init(_ capacity: Int) {
        // 初始化 记录空间长度
        self.capacity = capacity
        // 创建双向链表头尾绑定
        head.next = tail
        tail.pre = head
    }

    func get(_ key: Int) -> Int {
        // 存在
        if let node = nodeMap[key] {
            // 存在就要更新
            // 先删除
            deleteNode(node)
            // 再插入头部
            insertHead(node)
            // 返回值
            return node.val
        }
        // 不存在
        return -1
    }

    func put(_ key: Int, _ value: Int) {
        // 获取旧值
        let oriNode = nodeMap[key]
        // 创建新值链表结构
        let node = DLinkedNode(key, val: value)

        // 存在旧值
        if let oriNode = oriNode {
            // 先删除旧值
            deleteNode(oriNode)
            // 再在头部插入新值
            insertHead(node)
            // 更新字典
            nodeMap[key] = node
        } else {
            // 不存在
            // 存满
            if count >= capacity {
                // 删除表尾
                deleteTail()
                // -1
                count -= 1
            }
            // +1
            count += 1
            // 加入map
            nodeMap[key] = node
            // 插入头部
            insertHead(node)
        }
    }

    // 头部插入节点
    func insertHead(_ node: DLinkedNode) {
        let oriFirst = head.next
        oriFirst?.pre = node
        node.next = oriFirst
        node.pre = head
        head.next = node
    }

    // 删除指定节点
    func deleteNode(_ node: DLinkedNode) {
        node.pre?.next = node.next
        node.next?.pre = node.pre
        node.pre = nil
        node.next = nil
    }

    // 删除尾部 只有存满了加入新的才会调用
    func deleteTail() {
        if let delNode = tail.pre {
            delNode.pre?.next = tail
            tail.pre = delNode.pre
            nodeMap[delNode.key] = nil
        }
    }
}
