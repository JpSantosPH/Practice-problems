using Primes

function is_circular_prime(n)
    if isprime(n)
        a = reverse(digits(n))
        s, = size(a)
        for i in 1:s
            b = parse(Int, join(circshift(a , i)))
            if !isprime(b)
                return 0
            end
        end
        return n
    else
        return 0
    end
end

a = collect(1:999999)
b = is_circular_prime.(a)
c = filter!(!iszero, b)
n, = size(c)
n