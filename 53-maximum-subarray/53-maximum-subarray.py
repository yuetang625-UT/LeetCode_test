class Solution(object):
    def maxSubArray(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        res=-float('inf')
        count=0
        for i in range(len(nums)):
            count+=nums[i]
            if count>res:
                res=count
            if count<=0:
                count=0
        return res