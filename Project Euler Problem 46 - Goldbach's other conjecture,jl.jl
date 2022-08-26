using Primes

function odd_composite(n)
   if !isprime(n) && isodd(n)
        return n
   else
        return 0
   end
end

function prime_odd(n)
    if isprime(n) && isodd(n)
        return n
    else
        return 0
    end
end

function twice_square(n)
    2 * n^2  
end

a = [odd_composite(i) for i in 2:10000]
filter!(!iszero, a)

b = [twice_square(i) for i in 1:71]

function prime_twice_square(n)
    for j in prevprimes(n, n)
        for i in 1:71
            if j + b[i] == n
                return 0
            elseif j + b[i] > n
                break
            end
        end
    end
    return n
end

c = prime_twice_square.(a)
filter!(!iszero, c)
d, e = findmin(c)
return d