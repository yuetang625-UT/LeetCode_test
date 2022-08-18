class Solution:
    def maxUncrossedLines(self, nums1: List[int], nums2: List[int]) -> int:
        dp=[[0]*(len(nums2)+1) for _ in range(len(nums1)+1)] ### b 行 a 列
        result=0
        for i in range(1,len(nums1)+1):
            for j in range(1,len(nums2)+1):
                if nums1[i-1]==nums2[j-1]:
                    dp[i][j]=dp[i-1][j-1]+1
                else:  ####not continuous
                    dp[i][j]=max(dp[i-1][j],dp[i][j-1])
                result=max(result,dp[i][j])
        return result