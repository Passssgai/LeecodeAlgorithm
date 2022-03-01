/*
给定一个 m x n 二维字符网格 board 和一个字符串单词 word 。如果 word 存在于网格中，返回 true ；否则，返回 false 。

单词必须按照字母顺序，通过相邻的单元格内的字母构成，其中“相邻”单元格是那些水平相邻或垂直相邻的单元格。同一个单元格内的字母不允许被重复使用。

 

示例 1：


输入：board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
输出：true
示例 2：


输入：board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "SEE"
输出：true
示例 3：


输入：board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCB"
输出：false
 

提示：

m == board.length
n = board[i].length
1 <= m, n <= 6
1 <= word.length <= 15
board 和 word 仅由大小写英文字母组成
 

进阶：你可以使用搜索剪枝的技术来优化解决方案，使其在 board 更大的情况下可以更快解决问题？

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/word-search
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/

class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: board[0].count), count: board.count)
        func dfs(_ i: Int, _ j: Int, _ index: Int) -> Bool {
            if index == word.count {
                return true
            }
            if i < 0 || i >= board.count || j < 0 || j >= board[0].count || dp[i][j] {
                return false
            }
            if board[i][j] != word[String.Index(utf16Offset:index, in: word)] {
                return false
            }
            dp[i][j] = true
            let res = dfs(i + 1, j, index + 1) || dfs(i - 1, j, index + 1) || dfs(i, j + 1, index + 1) || dfs(i, j - 1, index + 1)
            dp[i][j] = false
            return res
        }
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                if dfs(i, j, 0) {
                    return true
                }
            }
        }
        return false
    }
}