# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def __init__(self):
            self.pre=TreeNode()
            
    def convertBST(self, root):
        """
        :type root: TreeNode
        :rtype: TreeNode
        """
        self.traversal(root)
        return root
    def traversal(self,root):
        if not root:
            return None
        self.traversal(root.right)
        root.val+=self.pre.val
        self.pre=root
        self.traversal(root.left)
        