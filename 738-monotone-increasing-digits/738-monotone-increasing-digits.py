class Solution(object):
    def monotoneIncreasingDigits(self, n):
        """
        :type n: int
        :rtype: int
        """
        n_str=list(str(n))
        for i in range(len(n_str)-1,0,-1):
            if int(n_str[i]) < int(n_str[i-1]):
                print n_str[i-1]
                n_str[i-1]=str(int(n_str[i-1])-1)
                n_str[i:]='9'*(len(n_str) - i) 
        return int("".join(n_str))
                