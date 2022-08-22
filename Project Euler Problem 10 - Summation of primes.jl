function sum_all_prime_below(n)
    num = [n] # for testing if prime
    dyn = [2]
    sto = convert(Vector{Int64}, []) # put here if prime

    while true

        while true # tests if prime
            if num[1] == dyn[1] # checks if prime

                append!(sto, num) # if yes, store prime
                break #  fetch the next number beow
            end

            if num[1] % dyn[1] == 0 # checks if divisible by something
                break # if yes, fetch the next number below
            end
            #if not divisible, check if prime
            dyn[1] = dyn[1] + 1 # add 1 to dyn to check if divisible
        end
        dyn[1] = 2 # sets the divisor to 2
        num[1] = num[1] - 1
        
        if num[1] == 1 # sets a lower bound of 1
            println(sto)
            break
        end
    end
    println(sum(sto))
end

sum_all_prime_below(1000000)
