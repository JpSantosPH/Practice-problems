function no_right_triang_solutions(n)
    d = Int[]
    for a in 1:n
        for b in 1:n
            for c in 1:n
                if ((a^2) + (b^2)) == (c^2) && a + b + c == n
                    if [a, b, c] ⊈ d
                        push!(d, a) ; push!(d, b) ; push!(d, c)
                    end
                end
            end
        end
    end
    s, = size(d)
    e = Int(s/3)
    return e
end
# I'm too lazy to find the upper bounds of a, b, and c
a = collect(1:1000)
b = no_right_triang_solutions.(a)
c, d = findmax(b)
d
# 840