//
//  如何随机生成不重复的 10个100 以内的数字？.swift
//  LCode
//
//  Created by Z on 2021/4/6.
//

// 如何随机生成不重复的 10个100 以内的数字？
func rand100(_ n: Int) -> [Int] {
    var nums: [Int] = []
    for i in 0 ... 100 {
        nums.append(i)
    }
    var ans: [Int] = []
    for i in 0 ..< n {
        let index = Int.random(in: 0 ... 100 - i)
        let val = nums[index]
        ans.append(val)
        nums[index] = nums[100 - i]
        nums[100 - i] = val
    }
    return ans
}
