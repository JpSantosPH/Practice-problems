function factorial_digit_sum(n)
    f = factorial(big(n))    
    sum(digits(f))
end

factorial_digit_sum(100)