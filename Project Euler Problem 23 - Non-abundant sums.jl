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

nl = Vector{Int64}([])
j = 0
i = 12
while true
    if sum_proper_divisor(i) > i
        if (12 + i) > 28123
            return nl
        end
        push!(nl, 0)
        j = j + 1
        nl[j] = i
    end
    i = i + 1
end
l, = length(nl)
m = Matrix{Int64}(zeros(l, l))
y, x = size(m)
m = nl .+ m
m = rotl90(m)
m = nl .+ m
u = reshape(m,y*x, 1)
z = intersect(1:28123, u)
a = setdiff(1:28123, z)
println(sum(a))