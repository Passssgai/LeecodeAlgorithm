/*
给定 n 个非负整数，用来表示柱状图中各个柱子的高度。每个柱子彼此相邻，且宽度为 1 。

求在该柱状图中，能够勾勒出来的矩形的最大面积。

 

示例 1:



输入：heights = [2,1,5,6,2,3]
输出：10
解释：最大的矩形为图中红色区域，面积为 10
示例 2：



输入： heights = [2,4]
输出： 4
 

提示：

1 <= heights.length <=105
0 <= heights[i] <= 104


来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/largest-rectangle-in-histogram
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/

class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        let length = heights.count
        if length == 0 {
            return 0
        }
        if length == 1 {
            return heights[0]
        }
        var maxArea = 0
        var stack = [Int]()
        for i in 0..<length {
            if stack.count == 0 || heights[stack.last!] <= heights[i] {
                stack.append(i)
            } else {            
                while stack.count > 0 && heights[stack.last!] > heights[i] {
                    var j = stack.popLast()!
                    maxArea = max(maxArea, heights[j] * (stack.count == 0 ? i : i - stack.last! - 1))
                }
                stack.append(i)
            }
        }
        while stack.count > 0 {
            let j = stack.popLast()!
            maxArea = max(maxArea, heights[j] * (stack.count == 0 ? length : length - stack.last! - 1))
        }
        return maxArea
    }
}