class Solution(object):
    def lemonadeChange(self, bills):
        """
        :type bills: List[int]
        :rtype: bool
        """
        charge={5:0,10:0,20:0}
        for i in bills:
            charge[i]+=1
            if i ==10:
                if charge[5]>=1:charge[5]-=1
                else: return False
            if i==20:
                if charge[10]>=1 and charge[5]>=1:
                    charge[10]-=1
                    charge[5]-=1
                elif charge[10]==0 and charge[5]>=3:
                    charge[5]-=3
                else:
                    return False
        return True
                
            
        