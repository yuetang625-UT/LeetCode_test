class Solution(object):
    def numSquares(self, n):
        """
        :type n: int
        :rtype: int
        """
        nums = [i**2 for i in range(1, n + 1) if i**2 <= n]
        dp=[n+1]*(n+1)
        dp[0]=0
        for i in nums:
            for j in range(i,n+1):
                dp[j]=min(dp[j],dp[j-i]+1)
        return dp[n] 