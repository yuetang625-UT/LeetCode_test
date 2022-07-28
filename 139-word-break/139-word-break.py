class Solution:
    def wordBreak(self, s: str, wordDict: List[str]) -> bool:
        dp=[False]*(len(s)+1)
        dp[0]=True
        for j in range(1,len(s)+1):
            for i in wordDict:
                if j>= len(i):
                    dp[j]=dp[j]or (dp[j-len(i)] and i==s[j-len(i):j])
        return dp[len(s)]
                    
        