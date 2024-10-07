function q = blockPattern(lambda,delta)
%
% q = blockPattern(lambda,delta)
%
% Dato un insieme di autovalori e un parametro delta positivo, questo
% algoritmo produce un un vettore di interi q, che assegna ogni autovalore
% ad un insieme, in modo che autovalori appartenenti allo stesso insieme
% siano ''vicini'' e che autovalori appartenenti a insiemi diversi siano
% sufficientemente ''lontani''.
% Se non viene specificato il delta è preimpostato a 0.1.
%
if (nargin == 1) || (isempty(delta))
    delta = 0.1;
end
p = 1;
n = size(lambda,1);
q = zeros(n,1);
for i = 1:n
    if q(i) == 0
        q(i) = p;
        p = p + 1;
    end
    for j = i+1:n
        if q(j) ~= q(i)
            if (abs(lambda(i) - lambda(j)) <= delta)
                if q(j) == 0
                    q(j) = q(i);
                else
                    a = max(q(i),q(j));
                    b = min(q(i),q(j));
                    q(q==a) = b;
                    q(q>a) = q(q>a)-1;
                    p = p - 1;
                end
            end
        end
    end
end