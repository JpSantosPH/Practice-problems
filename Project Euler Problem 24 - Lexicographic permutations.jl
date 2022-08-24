function is_lexi_perm(x)
    if Set(digits(x, pad=9+1)) != Set(0:9)
        return 0
    end
    x
end
lexi_perm = is_lexi_perm.(123456789:9:9876543210)
                # I freaking love broadcasting.
filter!(!iszero, lexi_perm)
s, = size(lexi_perm)
println(lexi_perm[1000000])
lexi_perm[5000]
# lexi_perm[1000000] == 2783915460