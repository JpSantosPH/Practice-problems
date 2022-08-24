f = BigFloat.([1, 1])
i = 3
while !contains(string(f[i-1]), "e+999")
    println([i], f[i-1])
    push!(f, 0)
    f[i] = f[i-2] + f[i-1]
    i = i + 1
end
s, = size(f)
BigFloat(f[s], precision=1024)