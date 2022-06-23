class Solution(object):
    def totalFruit(self, fruits):
        """
        :type fruits: List[int]
        :rtype: int
        """
        tmp=[fruits[0]]
        index=0
        res=0
        sum=1
        for i in range(1,len(fruits)):
            if fruits[i] not in tmp and len(tmp)<2:
                tmp.append(fruits[i])
                index=i
                sum+=1
            elif fruits[i] in tmp and len(tmp)==1:
                index=i
                sum+=1
            elif fruits[i] in tmp and len(tmp)==2:
                sum+=1
                if fruits[i]!=fruits[index]:
                    index=i
            else:
                res=max(res,sum)
                tmp=[fruits[index]]
                sum=i-index+1
                tmp.append(fruits[i])
                index=i
                
        return max(res,sum)        