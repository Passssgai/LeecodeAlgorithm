/*
3. 无重复字符的最长子串
给定一个字符串 s ，请你找出其中不含有重复字符的 最长子串 的长度。

 

示例 1:

输入: s = "abcabcbb"
输出: 3 
解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
示例 2:

输入: s = "bbbbb"
输出: 1
解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。z
示例 3:

输入: s = "pwwkew"
输出: 3
解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
     请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
示例 4:

输入: s = ""
输出: 0
 

提示：

0 <= s.length <= 5 * 104
s 由英文字母、数字、符号和空格组成

*/
// 解体思路：无重复字符的最长子串，可以用一个字典记录每个字符最终出现的位置，然后遍历字符串，如果字符出现过更新起始位置，则更新最长子串的长度，并且更新字典中的位置。
// 时间复杂度：O(n)
class Solution {
	func lengthOfLongestSubstring(_ s: String) -> Int {
		var max = 0
		var start = 0
		var end = 0
		var dict = [Character: Int]()
		for (index, char) in s.enumerated() {
			if let lastIndex = dict[char] {
				if lastIndex >= start {
					start = lastIndex + 1
				}
			}
			dict[char] = index
			end = index
			max = max > end - start + 1 ? max : end - start + 1
		}
		return max
	}
}