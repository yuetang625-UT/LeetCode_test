# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def findMode(self, root):
        """
        :type root: TreeNode
        :rtype: List[int]
        """
        from collections import defaultdict
        res=[]
        count=defaultdict(int)
        def nodeList(root):
            if root.left: nodeList(root.left)
            res.append(root.val)
            if root.right: nodeList(root.right)
            return res
        
        nodeList(root)
        
        for i in range(len(res)):
            count[res[i]]+=1
        print res
        max_value = [key for key, value in count.items() if value == max(count.values())]
        return max_value