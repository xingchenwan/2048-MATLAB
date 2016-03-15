%GUI Step. This routine will be executed everytime after a movement is
%done, namely to update the GUI (font(smaller font for larger numbers), face colour(gradual from yellow to red, as per original game design), number and text displayed) with new information due to
%movement on the board.
global StepCounter;
global Score;
for row = 1:4
    for col = 1:4
        Square = RectangleGroup(row,col); % Access the corresponding square
        Text = TextGroup(row,col);
        Text.FontName = 'Arial';
        if board(row,col) == 0
            Square.FaceColor = 'w';
            Text.String =' ';
        else
            if board(row,col) == 2
                Square.FaceColor = [1 1 0];
                Text.Color = 'k';
                Text.FontSize = 40;
            elseif board(row,col) == 4
                Square.FaceColor = [1 0.9 0];
                Text.Color = 'k';
                Text.FontSize = 40;
            else
                Text.Color = 'w';
                if board(row,col) == 8
                    Square.FaceColor = [1 0.8 0];
                    Text.FontSize = 40;
                elseif board(row,col) == 16 || board(row,col) == 32
                    Square.FaceColor = [1 0.7 0];
                    Text.FontSize = 30;
                elseif board(row,col) == 32
                    Square.FaceColor = [1 0.6 0];
                    Text.FontSize = 30;
                elseif board(row,col) == 64
                    Square.FaceColor = [1 0.5 0];
                    Text.FontSize = 30;
                elseif board(row,col) == 128
                    Square.FaceColor = [1 0.4 0];
                    Text.FontSize = 25;
                elseif board(row,col) == 256
                    Square.FaceColor = [1 0.3 0];
                    Text.FontSize = 25;
                elseif board(row,col) == 512
                    Square.FaceColor = [1 0.2 0];
                    Text.FontSize = 25;
                elseif board(row,col) == 1024
                    Square.FaceColor = [1 0.1 0];
                    Text.FontSize = 20;
                else
                    Square.FaceColor = [1 0 0];
                    Text.FontSize = 20;
                end
            end
            %Colour code
            Text.String = num2str(board(row,col));
        end
    end
end
StepDisplay.String = sprintf ('Steps Taken = %d', StepCounter);
ScoreDisplay.String = sprintf ('Score = %d', Score);
drawnow;

% Copyright (C) 2016 Xingchen Wan - All Rights Reserved

