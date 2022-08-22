function prime_nth(x)
    a = []
    n = [2]
    d = [2]
    while (x,) > size(a)
        while !(n[1] % d[1] == 0)
            d[1]= d[1] + 1
        end
        if n[1] > d[1]
            n[1] = n[1] + 1
            d[1] = 2
        else
            push!(a, n[1])
            n[1] = n[1] + 1
            d[1] = 2
        end
    end
    a[x]
end
prime_nth(10_001)