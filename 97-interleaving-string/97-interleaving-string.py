class Solution(object):
    def isInterleave(self, s1, s2, s3):
        """
        :type s1: str
        :type s2: str
        :type s3: str
        :rtype: bool
        """
        n1=len(s1)
        n2=len(s2)
        n3=len(s3)
        if n1+n2!=n3: return False
        dp=[[True]*(n2+1) for _ in range(n1+1)]
        for i in range(1,n2+1):
            dp[0][i]=dp[0][i-1] and s3[i-1] == s2[i-1]
        for i in range(1,n1+1):
            dp[i][0]=dp[i-1][0] and s3[i-1] == s1[i-1]
        for i in range(1,n1+1):
            for j in range(1,n2+1):
                case1=dp[i-1][j] and s3[i+j-1]==s1[i-1]
                case2=dp[i][j-1] and s3[i+j-1]==s2[j-1]
                dp[i][j]=case1 or case2
        return dp[n1][n2]