/*
给定一个整数数组prices，其中第  prices[i] 表示第 i 天的股票价格 。​

设计一个算法计算出最大利润。在满足以下约束条件下，你可以尽可能地完成更多的交易（多次买卖一支股票）:

卖出股票后，你无法在第二天买入股票 (即冷冻期为 1 天)。
注意：你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。

 

示例 1:

输入: prices = [1,2,3,0,2]
输出: 3 
解释: 对应的交易状态为: [买入, 卖出, 冷冻期, 买入, 卖出]
示例 2:

输入: prices = [1]
输出: 0
 

提示：

1 <= prices.length <= 5000
0 <= prices[i] <= 1000

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-with-cooldown
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var dp = Array(repeating:Array(repeating: 0, count: 3), count: prices.count)
        for i in 0..<prices.count {
            if i == 0 {
                dp[i][0] = 0
                dp[i][1] = -prices[i]
                dp[i][2] = 0
            } else {
                dp[i][0] = max(dp[i - 1][0], dp[i - 1][2])
                dp[i][1] = max(dp[i - 1][1], dp[i - 1][0] - prices[i])
                dp[i][2] = dp[i - 1][1] + prices[i]
            }
        }
        return max(dp[prices.count - 1][0], dp[prices.count - 1][2])
    }
}