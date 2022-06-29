class Solution(object):
    def combine(self, n, k):
        """
        :type n: int
        :type k: int
        :rtype: List[List[int]]
        """
        fin=[]
        path=[]
        def backtracking(n,k,index):
            if len(path)==k:
                fin.append(path[:])
                return
            for i in range(index,n+1):
                path.append(i)
                backtracking(n,k,i+1)
                path.pop()
                
        backtracking(n,k,1)
        return fin