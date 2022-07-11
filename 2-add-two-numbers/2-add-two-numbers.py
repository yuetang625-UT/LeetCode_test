# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def addTwoNumbers(self, l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:
        dummpy_head=ListNode(0)
        cur=dummpy_head
        carry=0
        while l1!=None or l2!=None or carry!=0:
            l1v=l1.val if l1 else 0
            l2v=l2.val if l2 else 0
            columnsum=l1v+l2v+carry
            carry=columnsum//10
            newNode=ListNode(columnsum%10)
            cur.next=newNode
            cur=newNode
            l1=l1.next if l1 else None
            l2=l2.next if l2 else None
        return dummpy_head.next