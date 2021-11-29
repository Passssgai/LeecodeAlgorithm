/*
给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。

请你将两个数相加，并以相同形式返回一个表示和的链表。

你可以假设除了数字 0 之外，这两个数都不会以 0 开头。

 

示例 1：


输入：l1 = [2,4,3], l2 = [5,6,4]
输出：[7,0,8]
解释：342 + 465 = 807.
示例 2：

输入：l1 = [0], l2 = [0]
输出：[0]
示例 3：

输入：l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
输出：[8,9,9,9,0,0,0,1]
 

提示：

每个链表中的节点数在范围 [1, 100] 内
0 <= Node.val <= 9
题目数据保证列表表示的数字不含前导零


来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/add-two-numbers
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/

// 往后进位，进位保存到下一个节点，如果还有其他值，进位继续，直到最后一个节点。

public class ListNode {
	public var val: Int
	public var next: ListNode?
 	public init() { self.val = 0; self.next = nil; }
 	public init(_ val: Int) { self.val = val; self.next = nil; }
 	public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
		var l1 = l1
		var l2 = l2
		var result: ListNode?
		var current: ListNode?
		var carry = 0
		while l1 != nil || l2 != nil {
			let val1 = l1?.val ?? 0
			let val2 = l2?.val ?? 0
			let sum = val1 + val2 + carry
			carry = sum / 10
			let node = ListNode(sum % 10)
			if result == nil {
				result = node
				current = node
			} else {
				current?.next = node
				current = node
			}
			l1 = l1?.next
			l2 = l2?.next
		}
		if carry > 0 {
			current?.next = ListNode(carry)
		}
		return result
    }
}

let solution = Solution()
let l1 = ListNode(2, ListNode(4, ListNode(3)))
let l2 = ListNode(5, ListNode(6, ListNode(4)))
let currentResult = solution.addTwoNumbers(l1, l2)
print(currentResult!.val,currentResult!.next!.val,currentResult!.next!.next!.val)
