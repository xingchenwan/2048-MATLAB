function new = ControlW (board)
%Executed after an attempt to move the blocks up (button W) is
%done. 
status = 0;
for row = 2:1:4 %Second row onwards
    for column = 1:4
        if board(row,column) ~= 0
            if board(row-1, column) == 0 || board(row-1, column) == board(row, column)
                board(row-1,column) = board(row-1,column) + board(row, column);
                board(row, column) = 0;
                status = 1; % indicating that this move is possible
            end
        end
    end
end
if status == 0 
    %For the first looping, if a change in number of board cannot be found,
    %then the W movement is invalid for the current board
    new = board;
    return
end
while status == 1
    status = 0;
    for row = 2:1:4
        for column = 1:4
            if board(row,column) ~= 0
                if board(row-1, column) == 0 || board(row-1, column) == board(row, column)
                    board(row-1,column) = board(row-1,column) + board(row, column);
                    board(row, column) = 0;
                    status = 1; % indicating that this move is possible
                    % board
                end
            end
        end
    end
end
new = board;

% Copyright (C) 2016 Xingchen Wan - All Rights Reserved

