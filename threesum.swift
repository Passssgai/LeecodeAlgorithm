/*
给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有和为 0 且不重复的三元组。

注意：答案中不可以包含重复的三元组。

 

示例 1：

输入：nums = [-1,0,1,2,-1,-4]
输出：[[-1,-1,2],[-1,0,1]]
示例 2：

输入：nums = []
输出：[]
示例 3：

输入：nums = [0]
输出：[]
 

提示：

0 <= nums.length <= 3000
-105 <= nums[i] <= 105

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/3sum
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        if nums.count < 3 {
            return result
        }
        let sortedNums = nums.sorted()
        for i in 0..<sortedNums.count - 2 {
            if i > 0 && sortedNums[i] == sortedNums[i - 1] {
                continue
            }
            var left = i + 1
            var right = sortedNums.count - 1
            while left < right {
                if left > i + 1 && sortedNums[left] == sortedNums[left - 1] {
                    left += 1
                    continue
                }
                let sum = sortedNums[i] + sortedNums[left] + sortedNums[right]
                if sum == 0 {
                    result.append([sortedNums[i], sortedNums[left], sortedNums[right]])
                }
                if sum > 0 {
                    right -= 1
                } else {
                    left += 1
                }
            }
        }
        return result
    }
}