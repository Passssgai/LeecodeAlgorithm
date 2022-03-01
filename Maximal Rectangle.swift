/*
给定一个仅包含 0 和 1 、大小为 rows x cols 的二维二进制矩阵，找出只包含 1 的最大矩形，并返回其面积。

 

示例 1：


输入：matrix = [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]
输出：6
解释：最大矩形如上图所示。
示例 2：

输入：matrix = []
输出：0
示例 3：

输入：matrix = [["0"]]
输出：0
示例 4：

输入：matrix = [["1"]]
输出：1
示例 5：

输入：matrix = [["0","0"]]
输出：0
 

提示：

rows == matrix.length
cols == matrix[0].length
1 <= row, cols <= 200
matrix[i][j] 为 '0' 或 '1'

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/maximal-rectangle
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/

class Solution {
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        if matrix.count == 0 {
            return 0
        }
        if matrix[0].count == 0 {
            return 0
        }
        var left = [Int](repeating: 0, count: matrix[0].count)
        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                if matrix[i][j] == "1" {
                    left[j] = left[j] + 1
                } else {
                    left[j] = 0
                }
            }
            var stack = [Int]()
            var maxArea = 0
            for j in 0..<matrix[0].count {
                if stack.count == 0 || left[stack.last!] <= left[j] {
                    stack.append(j)
                } else {
                    while stack.count > 0 && left[stack.last!] > left[j] {
                        var k = stack.popLast()!
                        maxArea = max(maxArea, left[k] * (stack.count == 0 ? j : j - stack.last! - 1))
                    }
                    stack.append(j)
                }
            }
            while stack.count > 0 {
                let k = stack.popLast()!
                maxArea = max(maxArea, left[k] * (stack.count == 0 ? matrix[0].count : matrix[0].count - stack.last! - 1))
            }
        }
        return maxArea
    }
}