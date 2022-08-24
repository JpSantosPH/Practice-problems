function square((a, b))
    x = a^b
    x
end
n = 100
function distinct_square(n)
    c = Vector{Tuple{BigFloat, BigFloat}}([])
    for a in 2:n
        for b in 2:n
            push!(c, (BigFloat(a), BigFloat(b)))
        end
    end
    c
    c = reshape(c, (n-1, n-1))
    c = square.(c)
    c = BigFloat.((Set(c)))
    s, = size(c)
    s
end

distinct_square(10)