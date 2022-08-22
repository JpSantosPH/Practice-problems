# found another solution that's much more efficient that uses Primes package for something, dunno, will try to improve on that, will rewrite from scratch later

pal_global_sto = [  [0, 9009, 906609, 99000099, 9966006699, 999000000999, 99956644665999, 9999000000009999],  # pale_large_prod
                    [0, 91, 913, 9901, 99681, 999001, 9997647, 99990001],  # pal_large_num[1]
                    [0, 99, 993, 9999, 99979, 999999, 9998017, 99999999],  # pal_large_num[2]
                    [0, 8, 80, 98, 298, 998, 370, 9998],  # # pal_large_num_diff
                    [0, 0, 0, 0, 25, 0, 27, 0] # fastest limiter_mutiplier
                    ]
                    
                    function pal_large(n; limiter_mutiplier=1)
    function update_dyn() # updates the prod and diff
        dyn[1] = num[1] * num[2]       
        dyn[2] = num[2] - num[1]
    end
    function update_dig() # updates the digits data
        dig = digits(dyn[1])
        siz, = size(dig)
        sta[1] = siz
        sta[2] = convert(Int64, floor(siz/2))
    end
    function update_sto(u_1) # updates the storage data
        for i in u_1
        sto[1] = dyn[1]
        sto[2] = num[1]
        sto[3] = num[2]
        sto[4] = dyn[2]
        sto[5] = dyn[2]
        end
    end
    function update_glo() # updates the global storage
        append!(pal_global_sto[1], sto[1,:])
        append!(pal_global_sto[2], sto[2,:])
        append!(pal_global_sto[3], sto[3,:])
        append!(pal_global_sto[4], sto[4,:])
    end
    function update_pal_test() # updates the pal_test
        for i in 1:sta[2]
            pal_test[i] = dig[i] == dig[sta[1] - i + 1]
        end
    end
    larg = parse(Int64, string(9)^n) # sets the largest posible n-digit number ie. 99999...nth
    num = [ larg    # num[1]
            larg    # num[2]
            ]
    dyn = [ num[1] * num[2] # num_prod
            num[2] - num[1] # num_diff
            ]
    dig = digits(dyn[1])
    siz, = size(dig)
    sta = [ siz 
            convert(Int64, floor(siz/2))
            ]
    sto = [ 0   # pal_large_prod
            0   # pal_large_num[1]
            0   # pal_large_num[2]
            0   # pal_large_num_diff
            0   # pal_num_diff # how close is num[1] and num[2]
            ]
    pal_test = convert(Vector{Int64}, zeros(sta[2]))    # [0, 0, 0, ... siz/2]
    all_true = convert(Vector{Int64}, ones(sta[2]))     # [1, 1, 1, ... siz/2]
    num_limiter = [ 0   # initial lower bound
                    0   # new upper bound
                    0   # new lower bound
                    ]
    if 2 <= n <= 3 # determines the initial lower bound is
        num_limiter[1] = parse(Int64, string(9) * string(n-2)^(n-1))
        else
        num_limiter[1] = convert(Int64, ceil(0.9(larg + 1) + (0.1(larg + 1) * (1 - (1 / (n - 3)^2) / (limiter_mutiplier)))))
        end

    while true # starts of checking for pal_large_prod

        update_pal_test() # tests if the num_prod is a pal

        if pal_test == all_true # if the product is a palindrome
            # store the closeness of the two numbers of the palindrome
            update_sto(5)
            # then check if the palindrome is larger than the previous palindrome
            if sto[1] < dyn[1] # if the palindrome is larger than the previous palindrome
                # store the larger palindrome 
                update_sto(1:4)
                # then output the next two numbers to be checked
            else # if it is not larger than the current large palindrome
                # check if the closeness of the two numbers of the palindrome is less than the previous palindrome
                if sto[4] > sto[5] # if it is less than
                    break # largest palindrome found
                end # if it is not less than
                # then output the next two numbers to be checked
            end 
            # outputs the next number to be checked
            num[2] = num[2] - 1
            num[1] = num[2] + 1
        end # if its not a palindrome
        # do nothing

        num[1] = num[1] - 1 # checks the next number below num[1]
        update_dyn() # multiply and subtract the new nums

        if num[1] <= num_limiter[1] # bounds num[1] to a lower limit of num_limiter[1]
            num[2] = num[2] - 1 # checks the next number below num[2]
            num[1] = num[2]     # set num[1] as num[2]
            update_dyn() # multiply and subtract the new nums
        end

        if dyn[1] < sto[1] # bounds prod to a lower limit of pal_large_prod 
            num[2] = num[2] - 1 # checks the next number below num[2]
            num[1] = num[2]     # set num[1] as num[2]
            update_dyn()    # multiply and subtract the new nums
        end

        update_dig() # updates the data of the new prod

        if dyn[1] < sto[1] # checks if the new prod is still below the lower limit of pal_large_prod
            break # if it is, pal_large(n) is found
        end

        if num[2] <= num_limiter[1] # if num[2] reaches the lower bound
            num[2] = larg # reset num[2] to the largest posible n-digit number
            num_limiter[2] = num_limiter[1] # set a new upper bound # previous upper bound == largest posible n-digit number
            num_limiter[3] = num_limiter[1] - ((larg + 1) - num_limiter[1]) # set a new lower bound
            update_dyn() # multiply and subtract the new nums
            update_dig() # updates the data of the new prod
            while true # starts checking for pal_large_prod
                update_pal_test() # tests if the num_prod is a pal

                if pal_test == all_true # if the num_prod is a pal
                    if sto[1] < dyn[1] # checks if the new pal is larger than old pal
                        update_sto(1:4) # stores data of pal_large in sto[1:4]
                    end
                    update_sto(5) # not larger, store num_diff
                    if sto[4] > sto[5] # checks if pal_nums is closer than pal_large_nums
                        break # if it is, found pal_large(n)
                    end
                    num[2] = num[2] - 1 # checks the number below num[2]
                    num[1] = num_limiter[2] # reset num[1] to the upper limit
                end

                num[1] = num[1] - 1 # checks the next number below num[1]
                update_dyn() # multiply and subtract the new numbers

                if num[1] <= num_limiter[3] # bounds num[1] to a lower limit of num_limiter[3]
                    num[2] = num[2] - 1 # checks the number below num[2]
                    num[1] = num_limiter[2] # reset num[1] to the upper limit
                    update_dyn() # multiply and subtract the new nums
                end

                if dyn[1] < sto[1]  # bounds prod to a lower limit of pal_large_prod
                    num[2] = num[2] - 1 # checks the number below num[2]
                    num[1] = num_limiter[2] # reset num[1] to the upper limit
                    update_dyn() # multiply and subtract the new nums
                end

                update_dig() # updates the data of the new prod

                if dyn[1] < sto[1] # checks if the new prod is still below the lower limit of pal_large_prod
                    break # if it is, pal_large(n) is found
                end

                if num[2] <= num_limiter[1] # if num[2] reaches the lower bound
                    num[2] = larg # reset num[2] to the largest posible n-digit number
                    num_limiter[2] = num_limiter[3] # set a new upper bound # previous upper bound == largest posible n-digit number
                    num_limiter[3] = num_limiter[3] - ((larg + 1) - num_limiter[1]) # set a new lower bound
                    update_dyn() # multiply and subtract the new nums
                    update_dig() # updates the data of the new prod
                end
            end
        end
    end
    if size(digits(larg)) > size(pal_global_sto[1]) # if not yet calculated
        update_glo() # puts the data of pal_large(n) to the global storage
    end
    println(num, dyn, sto, num_limiter)
    println(sto[1]) # pulls the pal_large_prod
end

pal_large(4; limiter_mutiplier=1)