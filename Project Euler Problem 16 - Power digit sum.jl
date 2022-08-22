
function sum_power_2_digit(num)
    n = BigFloat(exp2(num), precision=1024)
    s = string(n)
    l, = length(s)
    s[1]
    m = Vector{Int64}(zeros(l))
    for i in 1:l
        if occursin(r"[0-9]", string(s[i]))
            m[i] = parse(Int64, s[i])
        elseif s[i] == 'e'
            break
        end
    end
    println(sum(m))
end

sum_power_2_digit(1000)