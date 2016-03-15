function new = ControlD (board)
%Executed after an attempt to move the blocks to the right (button D) is
%done. 
status = 0;
for column = 3:-1:1 %Second column onwards
    for row = 1:4
        if board(row,column) ~= 0
            if board(row, column+1) == 0 || board(row, column+1) == board(row, column)
                board(row,column+1) = board(row,column+1) + board(row, column);
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
    return;
end
while status == 1
    status = 0;
    for column = 3:-1:1
        for row = 1:4
            if board(row,column) ~= 0
                if board(row, column+1) == 0 || board(row, column+1) == board(row, column)
                    board(row,column+1) = board(row,column+1) + board(row, column);
                    board(row, column) = 0;
                    status = 1; % indicating that this move is possible
                end
            end
        end
    end
end
new = board;

% Copyright (C) 2016 Xingchen Wan - All Rights Reserved
