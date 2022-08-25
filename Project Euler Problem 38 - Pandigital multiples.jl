n = 192

function is_pandigital_multiple(n)
    a = [n]
    b = 2
    while true
        c = n * b
        push!(a, c)
        d = join(a)
        l = length(d)
        if l < 9
            b = b + 1
        elseif l == 9
            if Set(digits(parse(Int, d))) == Set(1:9)
                return parse(Int, d)
            end
        elseif l > 9
            return 0
        end
    end
end

a = collect(1:999999)
b = is_pandigital_multiple.(a)
filter!(!iszero, b)
    # again xD
c, d = findmax(b)
c