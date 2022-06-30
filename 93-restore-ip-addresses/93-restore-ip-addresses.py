class Solution(object):
    def restoreIpAddresses(self, s):
        """
        :type s: str
        :rtype: List[str]
        """
        if len(s)>12:return []
        result=[]
        path=[]
        def backtracking(path,index):
            if len(path)==4:
                if index==len(s):
                    result.append(".".join(path[:]))
                    return
            for i in range(index+1,min(index+4, len(s)+1)):
                string=s[index:i]
                if not 0 <= int(string) <= 255:
                    continue
                if not string == '0' and not string.lstrip('0')==string:
                    continue
                path.append(string)
                backtracking(path,i)
                path.pop()
        backtracking([],0)
        return result