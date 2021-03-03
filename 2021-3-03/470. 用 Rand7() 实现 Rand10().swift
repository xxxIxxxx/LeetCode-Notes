//
//  470. 用 Rand7() 实现 Rand10().swift
//  LCode
//
//  Created by Z on 2021/3/3.
//

class Solution470 {
    func rand7() -> Int {
        0
    }

    // https://leetcode-cn.com/problems/implement-rand10-using-rand7/solution/cong-zui-ji-chu-de-jiang-qi-ru-he-zuo-dao-jun-yun-/

//    (rand_X() - 1) × Y + rand_Y() ==> 可以等概率的生成[1, X * Y]范围的随机数
//    即实现了 rand_XY()
    // (rand8 - 1) * 9 + rand9 ==> [1-72]
    
    
    // 时间复杂度: 期望时间复杂度为O(1),最差无穷
    // 空间复杂度:O(1)
    func rand10() -> Int {
        while true {
            let a = rand7()
            let rand49 = (a - 1) * 7 + rand7()
            if rand49 <= 40 {
                return rand49 % 10 + 1
            }
        }
    }
    
    
    // 时间复杂度: 期望时间复杂度为O(1),最差无穷
    // 空间复杂度:O(1)
    func rand10_2() -> Int {
        while true {
            let a = rand7()
            let rand49 = (a - 1) * 7 + rand7()
            if rand49 <= 40 {
                return rand49 % 10 + 1
            }
            
            let rand9 = rand49 - 40
            let rand63 = (rand9 - 1) * 7 + rand7()
            if rand63 <= 60 {
                return rand63 % 10 + 1
            }
            
            let rand3 = rand63 - 60
            let rand21 = (rand3 - 1) * 7 + rand7()
            if rand21 <= 20 {
                return rand21 % 10 + 1
            }
        }
    }
}
