using Primes

function sum_proper_divisor(n)
    if isprime(n)
        return 1
    end
    f = [1]
    q = n
    d = 2
    while !issubset(d, f) && d +1 < n
        if n % d == 0
            q = n / d
            if !issubset(q, f)
                push!(f, q)
            end
            if !issubset(d, f)
                push!(f, d)
            end
        end
        d = d + 1
        
    end
    sum(f)
end

function sum_amicable_num(n)
    an = []
    for i in 1:(n - 1)
        a = sum_proper_divisor(i)
        if sum_proper_divisor(a) == i  && i != a
            push!(an, i)
        end
    end
    sum(an)
end

sum_amicable_num(6000)