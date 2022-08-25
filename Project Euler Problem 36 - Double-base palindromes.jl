function is_double_base_pal(n)
    a = digits(n)
    b = reverse(a)
    c = digits(n, base=2)
    d = reverse(c)
    if a == b && c == d
        return n
    else
        return 0
    end
end

a = collect(1:999999)
b = is_double_base_pal.(a)
filter!(!iszero, b)
sum(b)
# took less than 5 minutes,
# I'm getting used to this broadcasting now xD