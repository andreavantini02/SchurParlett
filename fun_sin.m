function y = fun_sin(x,k)
r = mod(k,4);
switch r
    case 0
        y = sin(x);
    case 1
        y = cos(x);
    case 2
        y = -sin(x);
    case 3
        y = -cos(x);
end