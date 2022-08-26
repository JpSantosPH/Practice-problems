function nth_pentagonal(n)
    Int(n * (3n - 1) / 2)
end

function is_pentagon_sum_diff((j, i))
    if (j + i) ⊆ b && (abs(j - i)) ⊆ b
        return true
    else
        return false
    end
end

function isnotzero(n)
    if n == 0
        return false
    else
        return true
    end
end

a = [nth_pentagonal(n) for n in 1:999999]
b = Set(a)
c = Vector{Tuple}(Int.([]))

for j in 1:9999
    for i in (j+1):10000
        if is_pentagon_sum_diff((a[j], a[i]))
            push!(c, (j, i, abs(j - i)))
        end
    end
end
c

a[2167] - a[1020]