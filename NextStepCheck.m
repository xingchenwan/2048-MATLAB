function [StatusW, StatusS, StatusA, StatusD] = NextStepCheck(board, StepW, StepS, StepA, StepD)
%This function checks the possibility of movement of the next 4 possible moves
%(W,A,S,D). Status 1 indicates that player may move in that way (a valid move), whereas
%Status 0 indicates otherwise. 
StatusW = 1;
StatusS = 1;
StatusA = 1;
StatusD = 1;

if isIdentical(board,StepW) == 1
    StatusW = 0;
end
if isIdentical(board,StepS) == 1
    StatusS = 0;
end
if isIdentical(board,StepA) == 1
    StatusA = 0;
end
if isIdentical(board,StepD) == 1
    StatusD = 0;
end
%If the board after the attempted move is the same as the previous one, the move is invalid

% Copyright (C) 2016 Xingchen Wan - All Rights Reserved
    