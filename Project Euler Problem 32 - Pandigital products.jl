function is_pandigital(x)
    if Set(digits(x)) != Set(1:9)
        return 0
    end
    x
end

pandigital = is_pandigital.(123456789:9:987654321)
filter!(!iszero, pandigital)
s, = size(pandigital)

function m_2_3(n)
    a = digits(n)
    b = 10*a[1] + a[2]
    c = 100*a[3] + 10*a[4] + a[5]
    d = 1000*a[6] + 100*a[7] + 10*a[8] + a[9]
    if b * c == d
        return d
    else
        return 0
    end
end

function m_1_4(n)
    a = digits(n)
    b = a[1]
    c = 1000*a[2] + 100*a[3] + 10*a[4] + a[5]
    d = 1000*a[6] + 100*a[7] + 10*a[8] + a[9]
    if b * c == d
        return d
    else
        return 0
    end
end

pandigital_2_3 = m_2_3.(pandigital)
filter!(!iszero, pandigital_2_3)
pandigital_1_4 = m_1_4.(panditial)
filter!(!iszero, pandigital_1_4)

allpandigital = union(pandigital_2_3, pandigital_1_4)
sum(allpandigital)

9 * 876 == 7884 # max 1x3 # 8 digits too small
1 * 2345 == 2345 # min 1x4 # 9 digits yes
12 * 345 == 4140 # min 2x3 # 9 digits yes
123 * 456 == 56088 # min 3x3 # 11 digits too big