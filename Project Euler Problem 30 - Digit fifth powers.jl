function fifth_power(x)
    z = x^5
    z
end

function sum_digit_fifth_power(n)
    m = sum(fifth_power.(digits(n)))
    if n == m
        m
    else
        0
    end
end

5 * 9^5
6 * 9^5 # max
7 * 9^5

sum_digit_fifth_power(9999999)

a = collect(2:(6 * 9^5))
b = sum_digit_fifth_power.(a)
sum(b)