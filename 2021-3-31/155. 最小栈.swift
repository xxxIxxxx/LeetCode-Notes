//
//  155. 最小栈.swift
//  LCode
//
//  Created by Z on 2021/3/31.
//

class MinStack_155 {
    /** initialize your data structure here. */
    var stack: [Int] = []
    var minStack: [Int] = []

    init() {}

    func push(_ val: Int) {
        stack.append(val)
        let minVal = min(minStack.last ?? Int.max, val)
        if val <= minVal {
            // 因为出栈是 后进先出， 所以最下栈只保存后续出现的小值
            minStack.append(val)
        }
    }

    func pop() {
        let a = stack.removeLast()
        if a == minStack.last {
            minStack.removeLast()
        }
    }

    func top() -> Int {
        return stack.last ?? -1
    }

    func getMin() -> Int {
        return minStack.last!
    }
}
