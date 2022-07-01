class Solution(object):
    def subsets(self, nums):
        """
        :type nums: List[int]
        :rtype: List[List[int]]
        """
        result=[]
        path=[]
        def backtracking(nums,index):
            result.append(path[:])
            if index==len(nums):
                return
            for i in range (index,len(nums)):
                path.append(nums[i])
                backtracking(nums,i+1)
                path.pop()
        backtracking(nums,0)
        return result