function sum_sqrt_diff(n)
    f = []
    for i in 1:n
        push!((f), i^2)  
    end
    (sum(1:n))^2 - sum(f)
end

sum_sqrt_diff(100)