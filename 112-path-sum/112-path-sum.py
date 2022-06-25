# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def hasPathSum(self, root, targetSum):
        """
        :type root: TreeNode
        :type targetSum: int
        :rtype: bool
        """
        sum=0
        all=[]
        if not root:
            return False
        self.traversal(root,sum,all)
        return targetSum in all
        
    def traversal(self,cur,sum,all):
        sum+=cur.val
        if not cur.left and not cur.right:
            all.append(sum)
        if cur.left:
            self.traversal(cur.left, sum, all)
        if cur.right:
            self.traversal(cur.right, sum, all)