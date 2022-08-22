function smol_multiple(n)
    f = [n]
    g = [n]
    while g[1] > 1
        if f[1] % g[1] == 0
            g[1] = g[1] - 1
        else
            g[1] = n
            f[1] = f[1] + 1
        end
    end
    f[1]
end

u = smol_multiple(20)

function check_func(x, y)
    f = []
    for i in 1:y
        push!(f, x % i == 0)
    end
    for i in 1:y
        println(i, " ", f[i])
    end
end

check_func(u, 20)