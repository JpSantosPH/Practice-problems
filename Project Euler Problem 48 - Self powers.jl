a = [BigInt(i)^i for i in 1:1000]
b = sum(a)
c = digits(b)
d = parse(Int, join(reverse(c[1:10])))
return d
# take that C++ and your 64 bits