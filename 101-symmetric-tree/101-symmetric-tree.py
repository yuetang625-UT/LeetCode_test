# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def isSymmetric(self, root):
        """
        :type root: TreeNode
        :rtype: bool
        """
        if not root:
            return True
        return self.compare(root.left,root.right)
    
    def compare(self, left, right):
        if left == None and right != None: return False
        elif left != None and right == None: return False
        elif left==None and right == None: return True
        elif left.val != right.val: return False
        outside=self.compare(left.left, right.right)
        inside=self.compare(left.right, right.left)
        isSame = outside and inside
        return isSame