n = 14
a = 100
#function no_reciprocal_cycles(n; a=2000)
    b = Vector{Int64}([])
    y = 1
    z = floor((y*10)/n)
    i = 0
    for x in 1:(a-1)
        push!(b, floor((y*10)/n))
        i = i + 1
        y = (y*10) % n        
        if floor((y*10)/n) == z
            
            break
        elseif y == 0
            return b = empty(b)
        end
        if z == 0
            println([y, floor((y*10)/n), z])
            z = floor((y*10)/n)
            popfirst!(b)
        end
    end
    b
    l, = size(b)





# mistake
        j = 1
        i = 2
        r = []
        while true
            while true
                if b[j] == b[i]
                    k = i - j
                    m = k
                    while true
                        if i + k > l
                            push!(r, b[j])
                            break
                        end
                        if b[j+k] == b[i+k]
                            k = k + l
                        else
                            break
                        end
                    end
                end
                i = i + 1
                if i > l/2
                    break
                end
            end
            j = j + 1
            i = j + 1
            if i > l/2
                break
            end
        end
        r = reverse(r)
        s, = size(r)
        Set(r)
        if Set(r) == Set(0)
            return 0
        end
        T = false
        for i in 2:(s-1)
            if r[i] == r[i+1]
                r = r[1:i-1]
                s, = size(r)
                if s == 0
                    return 0
                else
                    return s
                end
            end
        end
        T = true
        if T == true
            return 0
        end
    #end

    a = collect(1:1000)
    b = no_reciprocal_cycles.(a)
    Y, X = findmax(b)
    return X
    b[300]
#



[0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
[0, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3] # and this repeating 1
[0, 2, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
[0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
[0, 1, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6]
[0, 1, 4, 2, 8, 5, 7, 1, 4, 2, 8, 5, 7, 1, 4, 2, 8, 5, 7, 1]
[0, 1, 2, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
[0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
[0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
[0, 0, 9, 0, 9, 0, 9, 0, 9, 0, 9, 0, 9, 0, 9, 0, 9, 0, 9, 0]
[0, 0, 8, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3]
[0, 0, 7, 6, 9, 2, 3, 0, 7, 6, 9, 2, 3, 0, 7, 6, 9, 2, 3, 0]
[0, 0, 7, 1, 4, 2, 8, 5, 7, 1, 4, 2, 8, 5, 7, 1, 4, 2, 8, 5]
[0, 0, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6]
[0, 0, 6, 2, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
[0, 0, 5, 8, 8, 2, 3, 5, 2, 9, 4, 1, 1, 7, 6, 4, 7, 0, 5, 8] # fix this this repeating 2
[0, 0, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5]
[0, 0, 5, 2, 6, 3, 1, 5, 7, 8, 9, 4, 7, 3, 6, 8, 4, 2, 1, 0]
[0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
[0, 0, 4, 7, 6, 1, 9, 0, 4, 7, 6, 1, 9, 0, 4, 7, 6, 1, 9, 0]