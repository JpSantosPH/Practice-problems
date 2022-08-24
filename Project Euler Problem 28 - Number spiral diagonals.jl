function spiral_number(n)
    a = 1
    b = 2
    c = 4
    while a + b < n^2 + 1
        a = a + b
        c = c - 1
        if c == 0
            b = b + 2
            c = 4
        end
    end
    a
end

spiral_number(1001)
# this took less than 5 minutes Im so proud xD