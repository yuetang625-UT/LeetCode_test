class Solution(object):
    def canJump(self, nums):
        """
        :type nums: List[int]
        :rtype: bool
        """
        cover=0
        if len(nums)==1: return True
        i=0
        while i <=cover:
            cover=max(i+nums[i],cover)
            if cover>=len(nums)-1:return True
            i+=1
        return False