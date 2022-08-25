using Primes

function isprime_1(n)
    if isprime(n)
        return n
    else
        return 0
    end
end

function is_pandigital(n)
    a = digits(n)
    s, = size(a)
    b = Set(a)
    c = Set(1:s)
    if b == c
        return n
    else
        return 0
    end
end

a = collect(1234567:9:7654321) # all 8-9 digit pandigital are divisible by 3 
a = isprime_1.(a)
filter!(!iszero, a)
a = is_pandigital.(a)
filter!(!iszero, a)
b, c = findmax(a)
return b