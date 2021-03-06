class Solution(object):
    def maxResult(self, nums, k):
        """
        :type nums: List[int]
        :type k: int
        :rtype: int
        """
        n=len(nums)
        score=[0]*n
        score[0]=nums[0]
        dq=deque()
        dq.append(0)
        for i in range(1,n):
            while dq and dq[0]<i-k:
                dq.popleft()
            score[i]=score[dq[0]]+nums[i]
            while dq and score[i]>=score[dq[-1]]:
                dq.pop()
            dq.append(i)
        return score[-1]