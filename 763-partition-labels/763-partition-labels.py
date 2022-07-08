class Solution(object):
    def partitionLabels(self, s):
        """
        :type s: str
        :rtype: List[int]
        """
        hash=[0]*26
        for i in range(len(s)):
            hash[ord(s[i])-ord('a')]=i
        res=[]
        left=0
        right=0
        for i in range(len(s)):
            right=max(right,hash[ord(s[i])-ord('a')])
            if i==right:
                res.append(right-left+1)
                left=i+1
        return res
            