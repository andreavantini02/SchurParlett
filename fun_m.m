function F = fun_m(A,fun)
%
% F = fun_m(A,fun)
%
max_its = 100;
[Q,T] = schur(A,'complex');
n = size(T,1);
if min(T-diag(diag(T)) == 0,[],'all')
    F = diag(fun(diag(T),0));
else
    delta = 0.1;
    q = blockPattern(diag(T),delta);
    q = confluent(q);
    [Q,T] = ordschur(Q,T,q);
    v = countequal(q);
    T = mat2cell(T,v,v);
    m = max(q);
    for j = 1:m
        F{j,j} = evaluateAtomicBlock(T{j,j},fun,max_its);
        for i = j-1:-1:1
            C = F{i,i}*T{i,j}-T{i,j}*F{j,j};
            for k = i+1:j-1
                C = C + (F{i,k}*T{k,j}-T{i,k}*F{k,j});
            end
            F{i,j} = sylvester(T{i,i},-T{j,j},C);
        end
    end
    for c = 1:m
        for r = 1:m
            if size(F{r,c},1) == 0
                nr = size(F{r,r},1);
                nc = size(F{c,c},2);
                F{r,c} = zeros(nr,nc);
            end
        end
    end
    F = cell2mat(F);
end
F = Q*F*Q';
if max(max(abs(imag(F)))) < 1e-12
    F = real(F);
end