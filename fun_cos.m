function y = fun_cos(x,k)
r = mod(k,4);
switch r
    case 0
        y = cos(x);
    case 1
        y = -sin(x);
    case 2
        y = -cos(x);
    case 3
        y = sin(x);
end