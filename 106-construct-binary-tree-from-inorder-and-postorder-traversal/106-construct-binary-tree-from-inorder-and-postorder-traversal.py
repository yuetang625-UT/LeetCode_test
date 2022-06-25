# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def buildTree(self, inorder, postorder):
        """
        :type inorder: List[int]
        :type postorder: List[int]
        :rtype: TreeNode
        """
        if not postorder: return None
        root_val=postorder[-1]
        root=TreeNode(root_val)
        
        sparator_idx=inorder.index(root_val)
        inorder_left=inorder[:sparator_idx]
        inorder_right=inorder[sparator_idx+1:]
        
        postorder_left=postorder[:len(inorder_left)]
        postorder_right=postorder[len(inorder_left):len(postorder)-1]
        
        root.left=self.buildTree(inorder_left,postorder_left)
        root.right=self.buildTree(inorder_right,postorder_right)
        
        return root