using Primes

function is_truncatable_prime(n)
    if !isprime(n) || n in 2:7
        return 0
    end
    a = digits(n)
    s, = size(a)
    b = copy(a)
    for i in 1:(s-1)
        pop!(a)
        popfirst!(b)
        a = parse(Int, join(reverse(a)))
        b = parse(Int, join(reverse(b)))
        if !isprime(a) || !isprime(b)
            return 0
        end
        a = digits(a)
        b = digits(b)
    end
    return n
end

a = collect(1:999999)
b = is_truncatable_prime.(a)
filter!(!iszero, b)
sum(b)
# I love this lazy method xD