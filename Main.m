% "2048". Original Game by Gabriele Ciruili. Copyright 2014 - 2016
% Re-written in MATLAB by Xingchen Wan (sann5476), University of Oxford (2016)

% Main executable File
Initialise;
input = 0;
global GUIOutput;
GUIOutput = 0;
StatusW = 1; StatusS = 1; StatusA = 1; StatusD = 1;
Moved = 0; 
global StepCounter;
global Score;
Score = 0;
StepCounter = 0;
% Check whether player has entered a valid move. If no, no new block will be added
while 1
    [CheckCode, Score] = Check(board);
    % Code 1: Player wins;
    % Code 2: The board is full but there are still possible steps; 
    % Code 3: Play loses;
    % Code 0: Normal Game
    if CheckCode == 1 
        questdlg ('Congratulations! You won! Press OK to the main screen to restart or quit','Congratulations','OK', 'OK');
    end
    StepW = ControlW(board);
    StepS = ControlS(board);
    StepA = ControlA(board);
    StepD = ControlD(board); %Four possible moves now
    [StatusW, StatusS, StatusA, StatusD] = NextStepCheck(board, StepW, StepS, StepA, StepD);
    if StatusW == 0 && StatusS == 0 && StatusA == 0 && StatusD == 0
        questdlg ('Sorry. You Lost. Press OK to the main screen to restart or quit','Game Over','OK', 'OK');
        CheckCode = 3;
    end
    waitforbuttonpress;
    %wait until user enters a command
    pause(0.3);
    %Change pause time here if the time isn't enough to execute all
    %previous commands.
    input = GUIOutput;
    Moved = 0;
    switch input
        case 1
            board = StepW;
            if StatusW == 1
                Moved = 1;
            end
        case 4
            board = StepS;
            if StatusS == 1
                Moved = 1;
            end
        case 2
            board = StepA;
            if StatusA == 1
                Moved = 1;
            end
        case 3
            board = StepD;
            if StatusD == 1
                Moved = 1;
            end
            %W = 1, A = 2, D = 3, S = 4. See Initialise.m
        case 6 % quit command
            %Quit animation
            cla;
            axis ([1 5 1 5]);
            text (1, 3, 'Thanks for playing!', 'FontName', 'Arial', 'FontSize', 40);
            pause(3);
            close;
            return;
        case 5
            clf('reset');
            Initialise;
            StepCounter = 0;
            Score = 0;
    end
    if input ~= 5 && input ~= 0 && Moved == 1
        board = NewBlock(board, CheckCode);
        StepCounter = StepCounter + 1;
        %function takes CheckCode argument. If the board is full, NewBlock
        %will not add one more block.
    end
    GUIStep;
end

% Copyright (C) 2016 Xingchen Wan - All Rights Reserved
