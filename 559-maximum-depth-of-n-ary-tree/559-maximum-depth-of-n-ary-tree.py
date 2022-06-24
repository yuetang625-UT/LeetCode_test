"""
# Definition for a Node.
class Node(object):
    def __init__(self, val=None, children=None):
        self.val = val
        self.children = children
"""

class Solution(object):
    def maxDepth(self, root):
        """
        :type root: Node
        :rtype: int
        """
        count=0
        if not root:
            return count
        from collections import deque
        que=deque([root])
        while que:
            size=len(que)
            for i in range(size):
                cur=que.popleft()
                if cur.children:
                    que.extend(cur.children)
            count+=1
        return count
                
                
                