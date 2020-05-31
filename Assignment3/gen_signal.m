function [x] = gen_signal(value,L)
t = 1:L;
switch value
    case '1'
        f1 = 697;
        f2 = 1209;
    case '2'
        f1 = 697;
        f2 = 1336;
    case '3'
        f1 = 697;
        f2 = 1477;
    case 'A'
        f1 = 697;
        f2 = 1633;
    case '4'
        f1 = 770;
        f2 = 1209;
    case '5'
        f1 = 770;
        f2 = 1336;
    case '6'
        f1 = 770;
        f2 = 1477;
    case 'B'
        f1 = 770;
        f2 = 1633;
    case '7'
        f1 = 852;
        f2 = 1209;
    case '8'
        f1 = 852;
        f2 = 1336;
    case '9'
        f1 = 852;
        f2 = 1477;
    case 'C'
        f1 = 852;
        f2 = 1633; 
    case '*'
        f1 = 941;
        f2 = 1209;
    case '0'
        f1 = 941;
        f2 = 1336;
    case '#'
        f1 = 941;
        f2 = 1477;
    case 'D'
        f1 = 941;
        f2 = 1633;
end
x = cos(f1*t) + cos(f2*t);    
end