function new = NewBlock (board, CheckCode)
% A routine that adds one more block at any empty block on the board. It
% will not be triggered if a) the board is full (but the player is yet to
% lose) or b) an invalid movement is triggered (e.g. an attempt to move
% right when there is no space/no blocks with same number to the right)
if CheckCode == 0 %Only add new block if there is empty space left
    row = randi([1 4],1,1);
    col = randi([1 4],1,1);
    while board(row,col) ~= 0
        row = randi([1 4],1,1);
        col = randi([1 4],1,1);
    end
    chance = randi([1 4],1,1);
    if chance == 1; % 25% of chance that the new number is 4
        board(row,col) = 4;
    else
        board(row,col) = 2;
    end
end
new = board;

% Copyright (C) 2016 Xingchen Wan - All Rights Reserved