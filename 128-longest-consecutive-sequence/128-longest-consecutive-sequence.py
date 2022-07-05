class Solution(object):
    def longestConsecutive(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        nums.sort()
        print(nums)
        if nums==[]: return 0
        if len(nums)==1: return 1
        pre=nums[0]
        maxs=1
        fin=1
        for i in range(1,len(nums)):
            if nums[i]==pre:
                continue
            if nums[i]-1==pre:
                maxs+=1
            else:
                fin=max(maxs,fin)
                maxs=1
            pre=nums[i]
        fin=max(maxs,fin)
        return fin
        
        