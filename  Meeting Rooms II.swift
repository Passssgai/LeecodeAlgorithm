/*
给你一个会议时间安排的数组 intervals ，每个会议时间都会包括开始和结束的时间 intervals[i] = [starti, endi] ，返回 所需会议室的最小数量 。

 

示例 1：

输入：intervals = [[0,30],[5,10],[15,20]]
输出：2
示例 2：

输入：intervals = [[7,10],[2,4]]
输出：1
 

提示：

1 <= intervals.length <= 104
0 <= starti < endi <= 106


来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/meeting-rooms-ii
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/

class Solution {
        func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        var events = [[Int:Int]]()
        print("intervals",intervals)
        var maxRoom = 0
        for interval in intervals {
            events.append([interval[0] : 1])
            events.append([interval[1] : -1])
        }
        
        let sortedEvents = events.sorted { (a, b) -> Bool in
            if a.keys.first! == b.keys.first! {
                return a.values.first! < b.values.first!
            }else {
                return a.keys.first! < b.keys.first!
            }
        }
        var current = 0
        for sortedEvent in sortedEvents {
            current += sortedEvent.values.first!
            maxRoom = max(maxRoom, current)
        }
        return maxRoom
    }
}