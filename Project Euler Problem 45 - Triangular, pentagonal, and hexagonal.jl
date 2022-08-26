function triangle_num(n)
    Int(n * (n + 1) / 2)
end

function pentagonal_num(n)
    Int(n * (3n - 1) / 2)
end

function hexagonal_num(n)
    Int(n * (2n - 1))
end

function is_pentagonal_hexagonal(n)
    if n ⊆ b && n ⊆ c
        return true
    else
        return false
    end

end

a = [triangle_num(i) for i in 1:1000000]
b = Set([pentagonal_num(i) for i in 1:577700])
c  = Set([hexagonal_num(i) for i in 1:500001])
d = 0

for i in 286:1000000
    if is_pentagonal_hexagonal(a[i])
        return d = a[i]
    end
end