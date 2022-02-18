/*
给你一个链表，删除链表的倒数第 n 个结点，并且返回链表的头结点。

 

示例 1：


输入：head = [1,2,3,4,5], n = 2
输出：[1,2,3,5]
示例 2：

输入：head = [1], n = 1
输出：[]
示例 3：

输入：head = [1,2], n = 1
输出：[1]
 

提示：

链表中结点的数目为 sz
1 <= sz <= 30
0 <= Node.val <= 100
1 <= n <= sz
 

进阶：你能尝试使用一趟扫描实现吗？

通过次数651,274提交次数1,496,070

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/

public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
  }
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var listArray = [Int]()
        var listNode = head
        while listNode != nil {
            listArray.append(listNode!.val)
            listNode = listNode?.next
        }
        if listArray.count == n {
            return head?.next
        }
        listArray.remove(at: listArray.count - n)
        let head:listNode? = ListNode(listArray[0])
        var tail = head
        for i in 1..<listArray.count {
            tail.next = ListNode(listArray[i])
            tail = tail?.next
        }
        return tail
    }
}