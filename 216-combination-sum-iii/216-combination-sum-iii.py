class Solution(object):
    def combinationSum3(self, k, n):
        """
        :type k: int
        :type n: int
        :rtype: List[List[int]]
        """
        fin=[]
        path=[]
        def backtracking(k,n,index):
            if len(path)==k:
                if sum(path)==n:
                    fin.append(path[:])
                return
            for i in range(index,10-(k-len(path))+1):
                path.append(i)
                backtracking(k,n,i+1)
                path.pop()
        backtracking(k,n,1)
        return fin
        