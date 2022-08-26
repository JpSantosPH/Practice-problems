using Primes

a = reverse(prevprimes(1000000,1000000))
c = []
for j in 1:78498
    b = a[j]
    for i in (j+1):78498
        b = b + a[i]
        if b > 999999
            b = b - a[i]
            if isprime(b)
                return push!(c, (b, j, i))
            else
                break
            end
        end
    end
end
p, j, i = c[1]
return (p, i-j) 
# achievement unlocked xD