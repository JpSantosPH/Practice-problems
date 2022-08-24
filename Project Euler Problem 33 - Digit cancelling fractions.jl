function curious_fraction((a, b))
    c = digits(a)
    d = digits(b)
    e = intersect(c, d)
    f = setdiff(c, e)
    g = setdiff(d, e)
    if isempty(f) || isempty(g) || isempty(e)
        return 0
    elseif e[1] == 0
        return 0
    elseif (a / b) == (f[1] / g[1]) && (f[1] / g[1]) < 1
        return f[1] / g[1]
    else
        return 0
    end
end
h = []
for a in 10:99
    for b in 10:99
        push!(h,(a, b))
    end
end
h = curious_fraction.(h)
h = filter!(!iszero, h)