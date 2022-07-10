class Solution(object):
    def maxProfit(self, prices, fee):
        """
        :type prices: List[int]
        :type fee: int
        :rtype: int
        """
        res=0
        minp=prices[0]
        for i in range(1,len(prices)):
            if prices[i]<minp:
                minp=prices[i]
            elif prices[i]>=minp and prices[i]<=minp+fee:
                continue
            else:
                res+=prices[i]-(minp+fee)
                minp=prices[i] -fee
        return res