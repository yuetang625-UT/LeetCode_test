class Solution(object):
    def permuteUnique(self, nums):
        """
        :type nums: List[int]
        :rtype: List[List[int]]
        """
        nums.sort()
        result=[]
        used_list=[False]*len(nums)
        def backtracking(nums,used_list,path):
            if len(path)==len(nums):
                result.append(path[:])
                return
            for i in range(len(nums)):
                if not used_list[i]:
                    if i>0 and nums[i]==nums[i-1] and not used_list[i-1]:
                        continue
                    path.append(nums[i])
                    used_list[i]=True
                    backtracking(nums,used_list,path)
                    used_list[i]=False
                    path.pop()
        backtracking(nums,used_list,[])
        return result