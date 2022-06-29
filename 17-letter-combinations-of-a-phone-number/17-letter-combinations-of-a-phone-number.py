class Solution(object):
    def letterCombinations(self, digits):
        """
        :type digits: str
        :rtype: List[str]
        """
        letter_map={'2':'abc',
                   '3':'def',
                   '4':'ghi',
                   '5':'jkl',
                   '6':'mno',
                   '7':'pqrs',
                   '8':'tuv',
                   '9':'wxyz'}
        fin=[]
        tmp=''
        
        def backtracking(digits,index,tmp):
            if index==len(digits):
                fin.append(tmp)
                return
            letters=letter_map[digits[index]]
            for l in letters:
                backtracking(digits,index+1,tmp+l)
        
        if not digits: return []
        backtracking(digits,0,'')
        return fin
            

            
                