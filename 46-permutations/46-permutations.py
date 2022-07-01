class Solution(object):
    def permute(self, nums):
        """
        :type nums: List[int]
        :rtype: List[List[int]]
        """
        result=[]
        path=[]
        def backtracking(nums):
            if len(path)==len(nums):
                result.append(path[:])
                return
            for i in range(len(nums)):
                if nums[i] in path:
                    continue
                path.append(nums[i])
                backtracking(nums)
                path.pop()
        backtracking(nums)
        return result