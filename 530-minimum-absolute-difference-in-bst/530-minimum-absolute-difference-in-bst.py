# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def getMinimumDifference(self, root):
        """
        :type root: TreeNode
        :rtype: int
        """
        res=[]
        r=float("inf")
        def buildaList(root):
            if root.left: buildaList(root.left)
            res.append(root.val)
            if root.right: buildaList(root.right)
            return res
        buildaList(root)
        
        for i in range(1,len(res)):
            r=min(abs(res[i]-res[i-1]),r)
        return r