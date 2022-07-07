class Solution(object):
    def eraseOverlapIntervals(self, intervals):
        """
        :type intervals: List[List[int]]
        :rtype: int
        """
        intervals.sort()
        cur=intervals[0][1]
        count=0
        for i in range(1,len(intervals)):
            if cur > intervals[i][0]:
                count+=1
                cur=min(cur,intervals[i][1])
            else:
                cur=intervals[i][1]
                
        return count