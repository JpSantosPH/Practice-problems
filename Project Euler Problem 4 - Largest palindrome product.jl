function    palendrome_all(n)
    num_1 = [parse(Int64,string(9)^n)]
    num_2 = [parse(Int64,string(9)^n)]
    prod_1 = [num_1[1] * num_2[1]]
    vec_1 = digits(prod_1[1])
    size_vec_1, = size(vec_1)
    con_1 = []
    con_2 = [0]
    con_3 = [0]
    con_4 = [0]
    diff_1 = [0] ###
    while num_2[1] > 1
        for i in 1:(convert(Int64, floor(size_vec_1/2))) # = floor(i/2)
            push!((con_1), vec_1[i] == vec_1[size_vec_1[1] - i + 1])
            con_2[1] = con_2[1] + con_1[i]
        end
        if con_2[1] == (convert(Int64, floor(size_vec_1/2)))
            if prod_1[1] > con_3[1]
                con_3[1] = prod_1[1]
                con_4[1] = num_2[1] - num_1[1]
                
            end
            if (num_2[1] - num_1[1]) < con_4[1]

                return con_3
            end
            num_2[1] = num_2[1] - 1
            num_1[1] = num_2[1]
        end
        if num_1[1] > 1
            num_1[1] = num_1[1] - 1
        else
            num_2[1] = num_2[1] - 1
            num_1[1] = num_2[1]
        end
        prod_1[1] = num_1[1] * num_2[1]
        vec_1 = digits(prod_1[1])
        size_vec_1, = size(vec_1)
        resize!(con_1, 0)
        con_2[1] = 0
    end
end

palendrome_all(6)