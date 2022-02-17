/*
给你一个字符串 s，找到 s 中最长的回文子串。

 

示例 1：

输入：s = "babad"
输出："bab"
解释："aba" 同样是符合题意的答案。
示例 2：

输入：s = "cbbd"
输出："bb"
 

提示：

1 <= s.length <= 1000
s 仅由数字和英文字母组成


来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/longest-palindromic-substring
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

*/

class Solution {
    func longestPalindrome(_ s:String) -> String {
        if s.count == 0 {
            return ""
        }
        var start = 0
        var end = 0
        let s = Array(s)
        for index in 0..<s.count {
            let len1 = expandAroundCenter(s, left: index, right: index) // 奇数
            let len2 = expandAroundCenter(s, left: index, right: index + 1) // 偶数
            let len = max(len1, len2)
            if len > end - start {
                start = index - (len - 1) / 2
                end = index + len / 2
            }
        }    
        return s[start...end].map { String($0) }.joined()
    }
    func expandAroundCenter(_ s:[Character], left:Int, right:Int) -> Int {
        var left = left
        var right = right
        while left >= 0 && right < s.count && s[left] == s[right] {
            left -= 1
            right += 1
        }
        return right - left - 1
    }

}