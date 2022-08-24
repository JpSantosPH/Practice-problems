function no_reciprocal_cycles(n)
    if n == 0
        return 0
    end
    r = 1
    x = 1
    z = Int64[]
    while true
        r = x % n
        if r == 0
            return 0
        end
        if r ⊆ z
            s, = size(z)
            for i in 1:s
                if z[i] == r
                    return s - i + 1
                end
            end
        end
        push!(z, r)
        x = 10r
    end
end
a = collect(1:1000)
b = no_reciprocal_cycles.(a)
n, i = findmax(b)