using Primes

function  first_triangle_number_over(no_divisor)
    tn = 3
    n = 3
    i = 3
    d = 2
    e = []
    while true
        tn = tn + i
        pf = collect(factor(tn))
        s, = size(pf)
        
        for j in 1:s
            push!(e, 0)
            e[j] = pf[j].second + 1
        end
        d = prod(e) 
        if d > no_divisor
            println([tn, i])
            break
        end
        empty!(e)
        i = i + 1
        n = 3
    end
end

first_triangle_number_over(500)
