class Solution(object):
    def solveSudoku(self, board):
        """
        :type board: List[List[str]]
        :rtype: None Do not return anything, modify board in-place instead.
        """
        self.backtracking(board)
    def backtracking(self,board):
        for i in range(len(board)):
            for j in range(len(board[0])):
                if board[i][j]!='.':continue
                for k in range (1,10):
                    if self.valid(i,j,k,board):
                        board[i][j]=str(k)
                        if self.backtracking(board): return True
                        board[i][j]='.'
                return False
        return True
    
    def valid(self,row,col,val,board):
        for i in range(9):
            if board[row][i]==str(val):
                return False
        for j in range(9):
            if board[j][col]==str(val):
                return False
        start_row=(row//3)*3
        start_col=(col//3)*3
        for i in range(start_row,start_row+3):
            for j in range(start_col,start_col+3):
                if board[i][j]==str(val):
                    return False
        return True