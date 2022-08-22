# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

function prime_fact_larg(n)
    f = [n]
    g = [2]
       while f[1] > 1
           if f[1] % g[1] == 0
                f[1] = f[1] / g[1]
           else
                g[1] = g[1] + 1
           end
       end
    g[1]
end

prime_fact_larg(600851475143)