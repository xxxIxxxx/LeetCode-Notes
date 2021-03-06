//
//  912. 排序数组.swift
//  LCode
//
//  Created by Z on 2021/2/27.
//

class Solution912 {
    // 时间复杂度 O(nlogn) n 为数组长度
    // 空间复杂度 O(h) h为递归调用的栈深度 最坏O(n)每次都不平衡  最好O(logn)每次都平衡

    func sortArray(_ nums: [Int]) -> [Int] {
        var nums = nums
        quickSory(&nums, 0, nums.count - 1)
        return nums
    }

    func quickSory(_ nums: inout [Int], _ left: Int, _ right: Int) {
        if left >= right { // 左右边界相遇就可以返回了
            return
        }

        // 让最小值的位置从最左边开始
        var minIndex = left
        let p = nums[right]
        for i in left ..< right {
            if nums[i] <= p { // 小于等于就移到前边，如果不包含等于最终分界值(minIndex)会不对
                swap(&nums, minIndex, i)
                minIndex += 1
            }
        }
        swap(&nums, minIndex, right)
        quickSory(&nums, left, minIndex - 1)
        quickSory(&nums, minIndex + 1, right)
    }

    func swap(_ nums: inout [Int], _ a: Int, _ b: Int) {
        let temp = nums[a]
        nums[a] = nums[b]
        nums[b] = temp
    }
}

//// 快排 递归
class Solution912_A {
    func sortArray(_ nums: [Int]) -> [Int] {
        var nums = nums
        sort2(&nums, 0, nums.count - 1)
        return nums
    }

    func sort2(_ nums: inout [Int], _ left: Int, _ right: Int) {
        if left < right {
            let p = partition(&nums, left, right)
            // 同样的方法处理分界值左边的数据 分界值的位置已经确定 所以传入 right = p - 1
            sort2(&nums, left, p - 1)
            // 同样的方法处理分界值右边的数据 分界值的位置已经确定 所以传入 left = p + 1
            sort2(&nums, p + 1, right)
        }
    }

    func partition(_ nums: inout [Int], _ left: Int, _ right: Int) -> Int {
        // 直接以 nums[right] 为分界值
        let p = nums[right]
        // 记录下一个 比分界值小的值 应该移动到哪个位置， 默认为最左边
        var minL = left
        for i in left ..< right {
            // 当前值 小于等于分界值，那么交换 i 和 minL 的值。否则不做处理
            if nums[i] <= p {
                swap(&nums, minL, i)
                // minL 已经被小于等于分界值的值占用，那么 += 1
                minL += 1
            }
        }
        // 到这里，在 minL 索引 前的值都是小于等于 分界值的，在 minL 到 right - 1，包括 minL 的值都是大于 分界值的。 分界值一直在最后
        // 所以 把分界值 和 nums[minL] 交换位置
        swap(&nums, minL, right)
        // 返回分界值所在的 位置
        return minL
    }

    func swap(_ nums: inout [Int], _ a: Int, _ b: Int) {
        let temp = nums[a]
        nums[a] = nums[b]
        nums[b] = temp
    }
}

// 快排 迭代
class Solution912_B {
    func sortArray(_ nums: [Int]) -> [Int] {
        var nums = nums
        sort(&nums, 0, nums.count - 1)
        return nums
    }

    func sort(_ nums: inout [Int], _ left: Int, _ right: Int) {
        // 取中间值 做为当前的 分界值
        let pivot = nums[(right - left) / 2 + left]
        var L = left
        var R = right

        // L < R 说明 L 和 R 没相遇
        while L < R {
            // 如果 pivot 左边的数小于 pivot，那么就不用移动这个数。
            // 接着继续看下一个 因为是从左往右  所以 L += 1
            // 如果这个数大于 pivot ， 那么跳出这个循环 且这个数的索引位 L

            while nums[L] < pivot {
                L += 1
            }

            // 如果 pivot 右边的数大于 pivot，那么就不用移动这个数。
            // 接着继续看下一个 因为是从右往左 所以 R -= 1
            // 如果这个数小于 pivot ， 那么跳出这个循环 且这个数的索引位 R

            while nums[R] > pivot {
                R -= 1
            }

            // L >= R 说明 pivot 左边已经是 全部小于等于 pivot ，右边 全部是 大于等于 pivot。 可以提前退出
            if L >= R {
                break
            }

            // 跳出了上边的两个循环之后 说明 分别找到了
            // 一个在 pivot 左边，但大于等于 pivot 的数，它的索引为 L
            // 一个在 pivot 右边，但小于等于 pivot 的数，它的索引位 R
            // 那么交换这两个数的位置

            let temp = nums[L]
            nums[L] = nums[R]
            nums[R] = temp

            // 交换完后 nums[L] 是小于等于 pivot, nums[R] 是大于等于 pivot

            // 如果 nums[L] == pivot 了,要让 R -= 1，
            if nums[L] == pivot {
                R -= 1
            }

            // 如果 nums[R] == pivot 了,要让 L += 1
            if nums[R] == pivot {
                L += 1
            }

            // 如果不处理 交换完后 nums[L] == pivot 和 nums[R] == pivot 的情况，
            // 当 nums[L] == pivot 和 nums[R] == pivot 都是 true 时，
            // 上边的两个 while 也不会在执行了， 那么 L 和 R 的数值也不会再发生变化 就卡死在这里了
        }

        // 到这里 L >= R 说明相遇了
        // 那么 pivot 左边的数都是 小于等于 pivot 的
        // 那么 pivot 右边的数都是 大于等于 pivot 的

        // 这一步是防止对 pivot 左右分别操作时越界
        if L == R {
            L += 1
            R -= 1
        }

        if left < R {
            // 继续处理 pivot 左边的数据
            sort(&nums, left, R)
        }

        if right > L {
            // 继续处理 pivot 右边的数据
            sort(&nums, L, right)
        }
    }
}
