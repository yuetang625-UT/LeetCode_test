class Solution(object):
    def maxProfit(self, k, prices):
        """
        :type k: int
        :type prices: List[int]
        :rtype: int
        """
        if len(prices)==0:
            return 0
        dp=[0]*(2*k+1)
        for i in range(1,2*k+1,2):
            dp[i]=-prices[0]
        for i in range(1,len(prices)):
            for j in range(1,2*k+1,2):
                dp[j]=max(dp[j],dp[j-1]-prices[i])
                dp[j+1]=max(dp[j+1],dp[j]+prices[i])
        return dp[2*k]