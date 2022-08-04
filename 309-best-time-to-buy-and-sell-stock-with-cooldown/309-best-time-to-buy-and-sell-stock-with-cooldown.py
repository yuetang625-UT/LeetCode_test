class Solution(object):
    def maxProfit(self, prices):
        """
        :type prices: List[int]
        :rtype: int
        """
        length=len(prices)
        if len==0:return 0
        dp=[[0]*4 for _ in range(length)]
        dp[0][0]=-prices[0]
        for i in range(1,length):
            dp[i][0]=max(dp[i-1][0], max(dp[i-1][3], dp[i-1][1]) - prices[i])
            dp[i][1]=max(dp[i-1][1], dp[i-1][3])
            dp[i][2]=dp[i-1][0]+prices[i]
            dp[i][3]=dp[i-1][2]
        return max(dp[length-1][3], dp[length-1][1], dp[length-1][2])