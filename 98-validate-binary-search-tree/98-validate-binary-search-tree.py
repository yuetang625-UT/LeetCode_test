# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def isValidBST(self, root):
        """
        :type root: TreeNode
        :rtype: bool
        """
        candidate=[]
        def traverse(root):
            if not root: return True
            traverse(root.left)
            candidate.append(root.val)
            traverse(root.right)
        
        def is_sort(nums):
            for i in range(1,len(nums)):
                if nums[i]<=nums[i-1]:
                    return False
            return True
        traverse(root)
        res=is_sort(candidate)
        return res