class Solution(object):
    def merge(self, intervals):
        """
        :type intervals: List[List[int]]
        :rtype: List[List[int]]
        """
        intervals.sort()
        res=[]
        if len(intervals)<=1: return intervals
        res.append(intervals[0])
        for i in range(1,len(intervals)):
            last=res[-1]
            if last[1]  >= intervals[i][0]:
                res[-1]=(last[0],max(last[1],intervals[i][1]))
            else:
                res.append(intervals[i])
        return res