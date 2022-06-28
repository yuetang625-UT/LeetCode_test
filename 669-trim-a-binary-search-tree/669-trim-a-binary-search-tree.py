# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def trimBST(self, root, low, high):
        """
        :type root: TreeNode
        :type low: int
        :type high: int
        :rtype: TreeNode
        """
        if not root: return None
        if root.val<low:
            return self.trimBST(root.right,low,high)
        if high<root.val:
            return self.trimBST(root.left,low,high)
        
        if low<=root.val<=high:
            root.left=self.trimBST(root.left,low,high)
            root.right=self.trimBST(root.right,low,high)
            
        return root