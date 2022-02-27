/*
给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。

 

示例 1：



输入：height = [0,1,0,2,1,0,1,3,2,1,2,1]
输出：6
解释：上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。 
示例 2：

输入：height = [4,2,0,3,2,5]
输出：9
 

提示：

n == height.length
1 <= n <= 2 * 104
0 <= height[i] <= 105


来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/trapping-rain-water
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/

class Solution {
    func trap(_ height: [Int]) -> Int {
        var leftMax:[Int] = []
        var rightMax:[Int] = []
        var ans = 0
        for i in 0..<height.count {
            leftMax.append(0)
            rightMax.append(0)
        }
        for i in 0..<height.count {
            if i == 0 {
                leftMax[i] = height[i]
            } else {
                leftMax[i] = max(leftMax[i-1], height[i])
            }
        }
        for i in stride(from: height.count-1, to: -1, by: -1) {
            if i == height.count-1 {
                rightMax[i] = height[i]
            } else {
                rightMax[i] = max(rightMax[i+1], height[i])
            }
        }
        for i in 0..<height.count {
            ans += min(leftMax[i], rightMax[i]) - height[i]
        }
        return ans
    }
}