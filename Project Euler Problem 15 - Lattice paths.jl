function lattice_paths(some_y, some_x)
    m = Matrix{BigInt}(zeros(some_y + 1, some_x + 1))
    y, x = size(m)
    for i in 1:x
        m[1, i] = 1
    end
    for j in 1:y
        m[j, 1] = 1
    end
    m
    for j in 2:y
        for i in 2:x
            m[j, i] = m[j-1, i] + m[j, i-1]
        end
    end
    println([m[some_y + 1, some_x + 1]])
end

lattice_paths(20, 20)