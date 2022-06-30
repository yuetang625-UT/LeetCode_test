class Solution(object):
    def combinationSum(self, candidates, target):
        """
        :type candidates: List[int]
        :type target: int
        :rtype: List[List[int]]
        """
        result=[]
        path=[]

        def backtracking(candidates,target,index):
            if sum(path)==target:
                result.append(path[:])
                return

            for i in range(index,len(candidates)):
                if sum(path)>target:
                    return
                path.append(candidates[i])
                backtracking(candidates,target,i)
                path.pop()
        backtracking(candidates,target,0)
        return result