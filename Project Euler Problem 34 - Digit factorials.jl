factorial(9)
factorial(8)
factorial(7)

n = 145
function curious_factorial(n)
    if n in 1:2
        return 0
    end
    a = digits(n)
    b = sum(factorial.(a))
    c = digits(b)
    if a == c
        return n
    else
        return 0
    end
end

a = collect(1:(factorial(9) * 7))
b = curious_factorial.(a)
filter!(!iszero, b)
sum(b)