class Solution(object):
    def findMinArrowShots(self, points):
        """
        :type points: List[List[int]]
        :rtype: int
        """
        points.sort()
        res=1
        for i in range(1,len(points)):
            if points[i][0] > points[i-1][1]:
                res+=1
            else:
                points[i][1]=min(points[i-1][1],points[i][1])
        return res
                