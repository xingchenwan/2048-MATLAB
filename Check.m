function [status,score] = Check(board)
% This function checks whether the winning condition is obtained, and also
% whether the board is completely filled. If so, new blocks will not be
% added. The second return value tallies the score for the current move.
status = 2;
score = 0;
for row = 1:4
    for col = 1:4
        score = score + board(row,col);
        if board(row,col) == 2048
            status = 1; % Win
            return
        end
        if status == 2 && board(row,col) == 0
            status = 0;
        end
    end
end

% Copyright (C) 2016 Xingchen Wan - All Rights Reserved