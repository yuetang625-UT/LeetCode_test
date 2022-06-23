# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def minDepth(self, root):
        """
        :type root: TreeNode
        :rtype: int
        count=1
        if not root:
            return 0
        que=[(root,1)]
        
        while que:
            cur,count=que.pop(0)
            if not cur.left and not cur.right:
                return count
            if cur.left:
                que.append((cur.left,count+1))
            if cur.right:
                que.append((cur.right,count+1))
        return count
        """
        if not root:
            return 0
        if not root.left and not root.right:
            return 1
        
        min_depth=10**9
        if root.left:
            min_depth=min(self.minDepth(root.left),min_depth)
        if root.right:
            min_depth=min(self.minDepth(root.right),min_depth)
        return min_depth+1