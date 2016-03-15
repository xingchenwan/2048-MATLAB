% Board matrix initialisation
board = zeros(4,4);
% board matrix setup
chance1 = randi([1,4],1,1);
chance2 = randi([1,4],1,1);
temp = randi([1,4],1,2);
row1 = temp(1);
row2 = temp(2);
temp = randi([1,4],1,2);
col1 = temp(1);
col2 = temp(2);
if chance1 == 1
    board(row1,col1) = 4;
else
    board(row1,col1) = 2;
    % board(row1,col1) = 2048
    % 75% chance of Instant win, for debugging only
end
if chance2 == 1
    board(row2,col2) = 4;
else
    board(row2,col2) = 2;
end
%The initial two blocks that are randomly chosen

%GUI Initialisation
global GUIOutput;
figure('name', '2048');
title('2048 (MATLAB Version) by Xingchen Wan');
ClickW = uicontrol('String','U','Position', [45 50 30 30], 'CallBack', 'GUIOutput = 1');
ClickA = uicontrol('String', 'L', 'Position', [10 10 30 30], 'CallBack', 'GUIOutput = 2');
ClickD = uicontrol('String', 'R','Position', [80 10 30 30], 'CallBack', 'GUIOutput = 3');
ClickS = uicontrol('String', 'D','Position', [45 10 30 30],'CallBack', 'GUIOutput = 4');
ClickRestart = uicontrol('String','Restart','Position', [500 10 50 30], 'CallBack', 'GUIOutput = 5');
ClickQuit = uicontrol('String','Quit','Position',[500 40 50 30], 'CallBack', 'GUIOutput = 6');
%Button Initialisation

ScoreDisplay = text (6, 4.8, 'Score = 0');
StepDisplay = text (6, 5, 'Steps Taken = 0');
RectangleGroup = gobjects(4,4);
TextGroup = gobjects(4,4);
% Text, counters, blocks initialisation.

for x = 1:4
    for y = 1:4
        RectangleGroup(x,y) = rectangle('Position', [y+1,5-x,0.9,0.9], 'Curvature', 0.2, 'FaceColor','w');
        % Map graph coordinates to the matrix position (row, col) = (col+1,
        % 5-row)
        TextGroup(x,y) = text(y+1+0.3, 5-x+0.4,' ');
    end
end
axis([1 5 1 5]);
axis equal;
axis off;

GUIStep;
% Copyright (C) 2016 Xingchen Wan - All Rights Reserved
