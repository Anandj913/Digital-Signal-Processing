function [x] = decode(I)
if I(1) == 1
    if I(2) == 5
        x = '1';
    elseif I(2) == 6
        x = '2';
    elseif I(2) == 7
        x = '3';
    elseif I(2) == 8
        x = 'A';
    end
end
if I(1) == 2
    if I(2) == 5
        x = '4';
    elseif I(2) == 6
        x = '5';
    elseif I(2) == 7
        x = '6';
    elseif I(2) == 8
        x = 'B';
    end
end
if I(1) == 3
    if I(2) == 5
        x = '7';
    elseif I(2) == 6
        x = '8';
    elseif I(2) == 7
        x = '9';
    elseif I(2) == 8
        x = 'C';
    end
end
if I(1) == 4
    if I(2) == 5
        x = '*';
    elseif I(2) == 6
        x = '0';
    elseif I(2) == 7
        x = '#';
    elseif I(2) == 8
        x = 'D';
    end
end        
end

