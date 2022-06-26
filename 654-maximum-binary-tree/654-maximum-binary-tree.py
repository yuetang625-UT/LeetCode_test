# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def constructMaximumBinaryTree(self, nums):
        """
        :type nums: List[int]
        :rtype: TreeNode
        """
        if not nums: return None
        maxvalue=max(nums)
        index=nums.index(maxvalue)
        root=TreeNode(maxvalue)
        
        left=nums[:index]
        right=nums[index+1:]
        
        root.left=self.constructMaximumBinaryTree(left)
        root.right=self.constructMaximumBinaryTree(right)
        
        return root