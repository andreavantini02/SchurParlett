function v = countequal(q)
n = length(q);
v(1) = 1;
counter = 1;
for i = 2:n
    if (q(i)==q(i-1))
        v(counter) = v(counter) + 1;
    else
        counter = counter + 1;
        v(counter) = 1;
    end
end