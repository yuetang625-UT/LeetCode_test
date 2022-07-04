class Solution(object):
    def candy(self, ratings):
        """
        :type ratings: List[int]
        :rtype: int
        """
        candyv=[1]*len(ratings)
        for i in range(1,len(ratings)):
            if ratings[i]>ratings[i-1]:
                candyv[i]=candyv[i-1]+1
        print(candyv)
        for j in range(len(ratings)-2,-1,-1):
            if ratings[j]>ratings[j+1]:
                candyv[j]=max(candyv[j],candyv[j+1]+1)
        print(candyv)
        return sum(candyv)