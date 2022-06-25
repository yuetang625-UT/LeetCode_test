# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def pathSum(self, root, targetSum):
        """
        :type root: TreeNode
        :type targetSum: int
        :rtype: List[List[int]]
        """
    
        def traversal(cur_node,remain):
            if not cur_node.left and not cur_node.right:
                if remain==0:
                    result.append(path[:])
            if cur_node.left:
                path.append(cur_node.left.val)
                traversal(cur_node.left,remain-cur_node.left.val)
                path.pop()
            if cur_node.right:
                path.append(cur_node.right.val)
                traversal(cur_node.right,remain-cur_node.right.val)
                path.pop()
        result,path=[],[]
        if not root:
            return result
        path.append(root.val)
        traversal(root,targetSum-root.val)
        return result            
                    