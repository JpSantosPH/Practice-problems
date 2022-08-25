function is_0_9_pandigital(n)
    if Set(digits(n, pad=9+1)) == Set(0:9)
        return true
    else
        return false
    end
end

function is_sub_string_divisibility(n)
    a = reverse(digits(n, pad=9+1))
    if  parse(Int, join(a[2:4])) % 2 == 0 && parse(Int, join(a[3:5])) % 3 == 0 && parse(Int, join(a[4:6])) % 5 == 0 && parse(Int, join(a[5:7])) % 7 == 0 && parse(Int, join(a[6:8])) % 11 == 0 && parse(Int, join(a[7:9])) % 13 == 0 && parse(Int, join(a[8:10])) % 17 == 0
        return true
    end
    return false
end

a = 123456789
b = Int.([])
while a != 9876543210
    if is_0_9_pandigital(a) && is_sub_string_divisibility(a)
        println([a])
        push!(b, a)
    end
    a = a + 9
end
return sum(b) # 16695334890