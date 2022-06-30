class Solution(object):
    def partition(self, s):
        """
        :type s: str
        :rtype: List[List[str]]
        """
        result=[]
        path=[]
        
        def backtracking(s,index):
            if index==len(s):
                result.append(path[:])
                return
            for i in range(index,len(s)):
                temp=s[index:i+1]
                if temp==temp[::-1]:
                    path.append(temp)
                    backtracking(s,i+1)
                    path.pop()
                else:
                    continue
        backtracking(s,0)
        return result