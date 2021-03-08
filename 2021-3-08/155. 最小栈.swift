//
//  155. 最小栈.swift
//  LCode
//
//  Created by Z on 2021/3/8.
//

class MinStack155 {
    var stack: [Int] = []
    var minList: [Int] = []
    
    init() {}
    
    func push(_ x: Int) {
        stack.append(x)
        let minCount = minList.last ?? Int.max
        
        if x <= minCount {
            minList.append(x)
        }
    }
    
    func pop() {
        let p = stack.popLast()
        let minCount = minList.last
        if minCount == p {
            minList.removeLast()
        }
    }
    
    func top() -> Int {
        stack.last ?? 0
    }
    
    func getMin() -> Int {
        minList.last ?? 0
    }
}
