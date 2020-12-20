---
title: 《剑指offer》系列<一>
date: 2020-05-17 21:54:06
tags:
- algorithm
categories:
- 算法
---
复习《剑指offer》第一天。<!--more-->

> 问题一：在一个二维数组中（每个一维数组的长度相同），每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序。请完成一个函数，输入这样的一个二维数组和一个整数，判断数组中是否含有该整数。
> [LeetCode](https://leetcode-cn.com/problems/shu-zu-zhong-zhong-fu-de-shu-zi-lcof/)

1. 解法一：map
```golang
func findRepeatNumber(nums []int) int {
    numMap := make(map[int]bool)
    for i := range nums {
        if numMap[nums[i]] {
            return nums[i]
        } else {
            numMap[nums[i]] = true
        }
    }
    return -1
}
```
2. 解法二：比较并交换。
例如：输入 nums = [2, 3, 1, 0, 2, 5, 3]，从 i = 0 开始比较 i 与 nums[i]，如果不相等，交换 nums[i] 与 nums[nums[i]]，直到 i 与 nums[i] 相等。
第一轮：[1, 3, 2, 0, 2, 5, 3]
第二轮：[3, 1, 2, 0, 2, 5, 3]
第三轮：[0, 1, 2, 3, 2, 5, 3]
此时 i 递增到 4，发现 nums[i] = nums[nums[i]]，便找到了重复元素。

```golang
func findRepeatNumber(nums []int) int {
    for i := range nums {
        if nums[i] < i && nums[i] == nums[nums[i]] {
            return nums[i]
        }
        if i != nums[i] {
            for i != nums[i] {
                if nums[i] == nums[nums[i]] {
                    return nums[i]
                }
                nums[i], nums[nums[i]] = nums[nums[i]], nums[i]
            }
        }
    }
    return -1
}
```

> 问题二：在一个 n * m 的二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序。请完成一个函数，输入这样的一个二维数组和一个整数，判断数组中是否含有该整数。[LeetCode](https://leetcode-cn.com/problems/er-wei-shu-zu-zhong-de-cha-zhao-lcof/)

解法：从右上角元素开始，若小于目标值，向左移动一位，否则向下移动一位。
```golang
func findNumberIn2DArray(matrix [][]int, target int) bool {
    if len(matrix) < 1 {
        return false
    }
    m, n := len(matrix), len(matrix[0])
    for i, j := 0, n - 1; i < m && j >= 0; {
        if matrix[i][j] == target {
            return true
        }
        if matrix[i][j] < target {
            i++
        } else {
            j--
        }
    }
    return false
}
```

> 问题三：请实现一个函数，把字符串 s 中的每个空格替换成"%20"。[LeetCode](https://leetcode-cn.com/problems/ti-huan-kong-ge-lcof/)

解法：构造字符数组，遍历字符串，当出现空格时字符数组依次增加 `%`, `2`, `0`，遍历跳过当前字符。
```golang
func replaceSpace(s string) string {
    if len(s) < 1 {
        return s
    }
    result := make([]byte, 0)
    for i := range s {
        if s[i] == ' ' {
            result = append(result, '%', '2', '0')
            i++
        } else {
            result = append(result, s[i])
        }
    }
    return string(result)
}
```

> 问题四：输入一个链表的头节点，从尾到头反过来返回每个节点的值（用数组返回）。[LeetCode](https://leetcode-cn.com/problems/cong-wei-dao-tou-da-yin-lian-biao-lcof/submissions/)

1. 解法一：递归遍历链表。
```golang
/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func reversePrint(head *ListNode) []int {
    result := make([]int, 0)
    if head == nil {
        return result
    }
    return append(reversePrint(head.Next), head.Val)
}
```
2. 解法二：使用额外数组记录。
```golang
/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func reversePrint(head *ListNode) []int {
    result := make([]int, 0)
    tmp := make([]int, 0)
    for head != nil {
        tmp = append(tmp, head.Val)
        head = head.Next
    }
    for i := range tmp {
        result = append(result, tmp[len(tmp) - i - 1])
    }
    return result
}
```
