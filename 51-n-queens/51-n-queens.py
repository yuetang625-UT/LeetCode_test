class Solution(object):
    def solveNQueens(self, n):
        """
        :type n: int
        :rtype: List[List[str]]
        """
        if not n: return []
        board=[['.']*n for _ in range(n)]
        res=[]
        def Valid(board,row,col):
            for i in range(len(board)):
                if board[i][col]=='Q':
                    return False
            i=row-1
            j=col-1
            while i>=0 and j>=0:
                if board[i][j]=='Q':
                    return False
                i-=1
                j-=1
            i=row-1
            j=col+1
            while i>=0 and j<len(board):
                if board[i][j]=='Q':
                    return False
                i-=1
                j+=1
            return True
        def backtracking(broad,row,n):
            if row==n:
                temp_res=[]
                for temp in board:
                    temp_str="".join(temp)
                    temp_res.append(temp_str)
                res.append(temp_res)
            for col in range(n):
                if not Valid(board,row,col):
                    continue
                board[row][col]='Q'
                backtracking(broad,row+1,n)
                board[row][col]='.'
        backtracking(board,0,n)
        return res
        