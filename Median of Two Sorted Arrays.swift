/*
给定两个大小分别为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。请你找出并返回这两个正序数组的 中位数 。

算法的时间复杂度应该为 O(log (m+n)) 。

 

示例 1：

输入：nums1 = [1,3], nums2 = [2]
输出：2.00000
解释：合并数组 = [1,2,3] ，中位数 2
示例 2：

输入：nums1 = [1,2], nums2 = [3,4]
输出：2.50000
解释：合并数组 = [1,2,3,4] ，中位数 (2 + 3) / 2 = 2.5
 

 

提示：

nums1.length == m
nums2.length == n
0 <= m <= 1000
0 <= n <= 1000
1 <= m + n <= 2000
-106 <= nums1[i], nums2[i] <= 106
通过次数623,962提交次数1,517,433

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/median-of-two-sorted-arrays
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var length1 = nums1.count
        var length2 = nums2.count
        var midIndex = 0
        var total = length1 + length2
        if total % 2 == 0 {
            midIndex = total / 2
        } else {
            midIndex = (total + 1) / 2
        }
        var i = 0
        var j = 0
        var count = 0
        var nums1Index = 0
        var nums2Index = 0
        var nums1Value = 0
        var nums2Value = 0
        var result = 0.0
        while count < midIndex {
            if i < length1 && j < length2 {
                if nums1[i] < nums2[j] {
                    nums1Value = nums1[i]
                    i += 1
                } else {
                    nums2Value = nums2[j]
                    j += 1
                }
            } else if i < length1 {
                nums1Value = nums1[i]
                i += 1
            } else if j < length2 {
                nums2Value = nums2[j]
                j += 1
            }
            count += 1
        }
        if total % 2 == 0 {
            result = Double(nums1Value + nums2Value) / 2
        } else {
            result = Double(nums1Value + nums2Value)
        }
    }
}