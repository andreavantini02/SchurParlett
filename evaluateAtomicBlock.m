function F = evaluateAtomicBlock(T,fun,max_its)
%
% F = evaluateAtomicBlock(T,fun,max_its)
%
tol = eps/2;
n = size(T,1);
if n > 1
    I = eye(n);
    N = triu(T,1);
    sigma = trace(T)/n;
    M = T - sigma*I;
    y = (I - abs(N))\ones(n,1);
    mu = norm(y,"inf");
    F = fun(sigma, 0)*I;
    P = M;
    s = 0;
    ordine_raggiunto = 0;
    while (s <= max_its)
        s = s + 1;
        F0 = F;
        F = F + fun(sigma,s)*P;
        P = P*M/(s+1);
        if (norm(F-F0,'fro') <= tol*norm(F,'fro'))
            l = max(s+1,ordine_raggiunto+1);
            for j = l:s+n
                O(:,j) = fun(diag(T),j);
            end
            ordine_raggiunto = s+n;
            MAX = max(abs(O(:,s+1:s+n)));
            MAX = MAX./factorial(0:n-1);
            D = max(MAX);
            if mu*D*norm(P,'fro') <= tol*norm(F,'fro')
                break
            end
        end
    end
else
    F = fun(T,0);
end