class Solution(object):
    def findTargetSumWays(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: int
        """
        sumValue=sum(nums)
        if abs(target)>sumValue or (sumValue+target)%2==1:
            return 0
        bagsize=(sumValue+target)//2
        dp=[0]*(bagsize+1)
        dp[0]=1
        for i in range(len(nums)):
            for j in range(bagsize,nums[i]-1,-1):
                dp[j]+=dp[j-nums[i]]
        return dp[bagsize]
            