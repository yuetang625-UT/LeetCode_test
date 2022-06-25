# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def buildTree(self, preorder, inorder):
        """
        :type preorder: List[int]
        :type inorder: List[int]
        :rtype: TreeNode
        """
        if not preorder: return None
        
        root_val=preorder[0]
        root=TreeNode(root_val)
        
        separator_idx=inorder.index(root_val)
        inorder_left=inorder[:separator_idx]
        inorder_right=inorder[separator_idx+1:]
        
        preorder_left=preorder[1:1+len(inorder_left)]
        preorder_right=preorder[1+len(inorder_left):]
        
        root.left=self.buildTree(preorder_left,inorder_left)
        root.right=self.buildTree(preorder_right,inorder_right)
        
        return root
        