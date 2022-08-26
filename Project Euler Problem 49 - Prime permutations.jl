using Primes

function prime_no(n)
    if isprime(n)
        return n
    else
        return 0
    end
end

a = [prime_no(i) for i in 1000:9999]
a = filter!(!iszero, a)
b = []

for j in 1:1061
    for i in 1:4500
        if isprime(a[j] + i) && isprime(a[j] + 2i) && Set(digits(a[j])) == Set(digits(a[j] + i)) == Set(digits(a[j] + 2i))
                push!(b, (a[j], a[j] + i, a[j] + 2i))
        end
    end
end

z, x, y = b[3]
z = reverse(digits(z))
z = join(z)
x = reverse(digits(x))
x = join(x)
y = reverse(digits(y))
y = join(y)
return parse(Int, z*x*y)