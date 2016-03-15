function status = isIdentical(old,new)
% A function to check whether board after the attempted movement is identical to the one before that 
status = 1;
for row = 1:4
    for col = 1:4
        if old(row,col) ~= new(row,col)
            status = 0;
            return
        end
    end
end

% Copyright (C) 2016 Xingchen Wan - All Rights Reserved