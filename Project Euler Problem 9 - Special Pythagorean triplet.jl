
# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
# a^2 + b^2 = c^2
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.


function phyth_trip()
    a = [1.0]
    b = [1.0]
    c_2 = [a[1]^2 + b[1]^2]
    c = [sqrt(c_2[1])]

    while true
        if a[1]^2 + b[1]^2 == c_2[1] # checks if Pythagorean triplet
            if a[1] + b[1] + c[1] == 1000 # if yes, checks if the sum of the Pythagorean triplet is 1000
                println(convert(Vector{Int64}, a) , convert(Vector{Int64}, b), convert(Vector{Int64}, c))
                println(a[1]^2 + b[1]^2 == c_2[1])
                break
            end
        end
        # if not Pythagorean triplet
        a[1] = a[1] + 1 # updates a


        c_2[1] = a[1]^2 + b[1]^2 # updates c^2
        c[1] = sqrt(c_2[1]) # updates c

        if a[1] >= 500 # bound a and b to an upper limit
            b[1] = b[1] + 1
            a[1] = b[1] + 1
        end
    end
end

phyth_trip()