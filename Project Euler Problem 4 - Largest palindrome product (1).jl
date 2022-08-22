function pali_larg(n)
    larg = parse(Int64,string(9)^n)
    num = [ larg
            larg
            ]
    dyn = [ num[1] * num[2]
            num[2] - num[1]
            ]
    stor = [    0
                0
                0
                0
                0
            ]
    dig = digits(dyn[1])
    siz, = size(dig)
    sta = [ siz 
            convert(Int64, floor(siz/2))
            ]
    pal_test = convert(Vector{Int64}, zeros(sta[2]))
    all_true = convert(Vector{Int64}, ones(sta[2]))

    while  dyn[1] > stor[1]
        while dyn[1] > stor[1]

            for i in 1:sta[2]
                pal_test[i] = dig[i] == dig[sta[1] - i + 1]
            end

            if pal_test == all_true
                println(num, dyn, stor, sta)    
                println(pal_test, all_true)
                if dyn[1] > stor[1] 
                    stor[1] = dyn[1]
                    stor[2] = dyn[2]
                    stor[4] = num[1]
                    stor[5] = num[2]
                end
                num[2] = num[2] - 1
                num[1] = num[2]
                stor[3] = dyn[2]
            end
            if num[1] > 1
                num[1] = num[1] - 1
            else
                num[2] = num[2] - 1
                num[1] = num[2]
            end

            dyn[1] = num[1] * num[2]
            dyn[2] = num[2] - num[1]
            dig = digits(dyn[1])
            siz, = size(dig)
            sta[1] = siz
            sta[2] = convert(Int64, floor(siz/2))
            pal_test = convert(Vector{Int64}, zeros(sta[2]))
        end

        num[2] = num[2] - 1
        num[1] = num[2]
        if num[1] > 1
            num[1] = num[1] - 1
        else
            num[2] = num[2] - 1
            num[1] = num[2]
        end
        dyn[1] = num[1] * num[2]
        dyn[2] = num[2] - num[1]
        dig = digits(dyn[1])
        siz, = size(dig)
        sta[1] = siz
        sta[2] = convert(Int64, floor(siz/2))
        pal_test = convert(Vector{Int64}, zeros(sta[2]))

    end
    println(num, dyn, stor, sta)
    stor[1]
end

pali_larg(6)