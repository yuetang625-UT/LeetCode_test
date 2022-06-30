class Solution(object):
    def combinationSum2(self, candidates, target):
        """
        :type candidates: List[int]
        :type target: int
        :rtype: List[List[int]]
        """
        result=[]
        path=[]
        candidates.sort()
        def backtracking(candidates,target,index):
            if sum(path)==target:
                result.append(path[:])
                return
            if sum(path)>target:
                return
            for i in range(index,len(candidates)):
                if i > index and candidates[i]==candidates[i-1]:
                    continue
                path.append(candidates[i])
                backtracking(candidates,target,i+1)
                path.pop()

                
        backtracking(candidates,target,0)
        return result
            