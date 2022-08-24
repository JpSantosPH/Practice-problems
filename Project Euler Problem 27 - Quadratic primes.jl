using Primes

function no_prime((a, b))
    if abs(a) >= 1000
        return 0
    elseif abs(b) > 1000
        return 0
    end
    n = 0
    while  true
        if abs(a) >= 1000
            return 999999
        elseif abs(b) > 1000
            return 999999
        end
        c = n^2 + a*n + b
        if isprime(c) == true
            n = n + 1
        else
            if n == 0
                return 0
            else
                return n - 1
            end
        end
    end
end

c = []
for a in -1000:1000
    for b in -1000:1000
        push!(c,(a, b))
    end
end
c = reshape(c, (2001, 2001))
d = no_prime.(c)
# I'm getting good at broadcasting xD
n, b_a = findmax(d)
c[1972, 940]
n
b = b_a[1] - 1001
a = b_a[2] - 1001

no_prime((-61, 971))