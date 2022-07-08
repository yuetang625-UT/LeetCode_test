class Solution(object):
    def minCost(self, houses, cost, m, n, target):
        """
        :type houses: List[int]
        :type cost: List[List[int]]
        :type m: int
        :type n: int
        :type target: int
        :rtype: int
        """
        dp=[[[-1]*(target+1) for _ in range(n)] for _ in range(m)]
        if houses[0]==0:
            for j in range(n):
                dp[0][j][1]=cost[0][j]
        else:
            j=houses[0]-1
            dp[0][j][1]=0
        
        for i in range(1,m):
            if houses[i]==0:
                for j2 in range(n):
                    for k in range(1,target+1):
                        for j1 in range(n):
                            if j1==j2:
                                if dp[i-1][j1][k]!=-1:
                                    if dp[i][j2][k] == -1 or dp[i-1][j1][k]+cost[i][j2]<dp[i][j2][k]:
                                        dp[i][j2][k]=dp[i-1][j1][k]+cost[i][j2]
                            else:
                                if dp[i-1][j1][k-1]!=-1:
                                    if dp[i][j2][k]==-1 or dp[i-1][j1][k-1]+cost[i][j2]<dp[i][j2][k]:
                                        dp[i][j2][k] = dp[i-1][j1][k-1]+cost[i][j2]
            else:
                j2=houses[i]-1
                for k in range(1,target+1):
                    for j1 in range(n):
                        if j1==j2:
                            if dp[i-1][j1][k]!=-1:
                                if dp[i][j2][k]==-1 or dp[i - 1][j1][k] < dp[i][j2][k]:
                                    dp[i][j2][k]=dp[i - 1][j1][k]
                        else:
                            if dp[i-1][j1][k-1]!=-1:
                                if dp[i][j2][k]==-1 or dp[i - 1][j1][k-1] < dp[i][j2][k]:
                                    dp[i][j2][k]=dp[i - 1][j1][k-1]
           
        ans=[dp[-1][j][-1] for j in range(n) if dp[-1][j][-1] != -1]
        return min(ans) if ans else -1