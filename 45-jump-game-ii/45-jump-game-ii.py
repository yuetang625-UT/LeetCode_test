class Solution(object):
    def jump(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        if len(nums)==1: return 0
        ans=0
        curD=0
        nextD=0
        for i in range(len(nums)):
            nextD=max(i+nums[i],nextD)
            if i==curD:
                if curD != len(nums)-1:
                    ans+=1
                    curD=nextD
                    if nextD>=len(nums): break
        return ans