class Solution(object):
    def subsetsWithDup(self, nums):
        """
        :type nums: List[int]
        :rtype: List[List[int]]
        """
        nums.sort()
        result=[]
        path=[]
        def backtracking(nums,index):
            result.append(path[:])
            if index==len(nums):
                return
            for i in range(index,len(nums)):
                if i>index and nums[i]==nums[i-1]:
                    continue
                path.append(nums[i])
                backtracking(nums,i+1)
                path.pop()
        backtracking(nums,0)
        return result
                