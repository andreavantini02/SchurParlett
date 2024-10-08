function u = confluent(q)
%
% u = confluent(q)
%
% Sia q un vettore di interi positivi, restituisce una permutazione
% confluente di q
%
n = length(q);
m = max(q);
N = zeros(m,1);
I = zeros(m,1);
for i = 1:n
    I(q(i)) = I(q(i))+i;
    N(q(i)) = N(q(i))+1;
end
I=I./N;
[I,p] = sort(I);
N = N(p);
if max(q) > 1
    u = ones(N(1),1)*p(1);
    for j =2:m
        u(end+1:end+N(j)) = ones(N(j),1)*p(j);
    end
else
    u = ones(n,1);
end
