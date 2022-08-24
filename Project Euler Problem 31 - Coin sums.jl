a = 1 # max 200
b = 2 # max 100
c = 5 # max  40
d = 10 # max 20  
e = 20 # max 10
f = 50 # max 4
g = 100 # max 2

i = []
i = BitVector(i)

for a in 0:1:200
    for b in 0:2:200
        for c in 0:5:200
            for d in 0:10:200
                for e in 0:20:200
                    for f in 0:50:200
                        for g in 0:100:200
                            if sum([a, b, c, d, e, f, g]) == 200
                                push!(i, true)
                            end
                        end
                    end
                end
            end
        end
    end
end
i
s, = size(i)
s
# 73682 different ways.