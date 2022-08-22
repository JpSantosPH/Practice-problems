function longest_collatz_chain_under(x)
    ls = 0
    lc = 0
    c = 0
    for i in 2:(x - 1)
        n = i
        while n != 1
            if iseven(n)
                n = n / 2
            else
                n = 3n + 1
            end
            c = c + 1
        end
        if c > lc
            ls = i
            lc = c
        end
        c = 0
    end
    println([ls, lc])
end

longest_collatz_chain_under(1000000)