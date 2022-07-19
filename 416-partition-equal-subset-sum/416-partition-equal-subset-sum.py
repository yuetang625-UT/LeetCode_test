class Solution(object):
    def canPartition(self, nums):
        """
        :type nums: List[int]
        :rtype: bool
        """
        if sum(nums)%2 !=0:
            return False
        else:
            target=sum(nums)/2
        dp=[0]*(target+1)
        for i in range(len(nums)):
            for j in range(target,nums[i]-1,-1):
                dp[j]=max(dp[j],dp[j-nums[i]]+nums[i])
        return target==dp[target]
        