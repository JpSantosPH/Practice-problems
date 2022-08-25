txt = open("p042_words.txt") do file
    read(file, String)
end

function is_triangle_word(n)
    if n ⊆ f
        return n
    else
        return 0
    end
end
a = split(txt, ",")
b = chop.(a, head = 1, tail = 1)
c = split.(b, "")
d = Vector{Vector{Int64}}(replace.(c, "A" => 1, "B" => 2, "C" => 3 ,"D" => 4 ,"E" => 5 ,"F" => 6 ,"G" => 7, "H" => 8, "I" => 9, "J" => 10, "K" => 11, "L" => 12, "M" => 13, "N" => 14, "O" => 15, "P" => 16, "Q" => 17, "R" => 18, "S" => 19, "T" => 20, "U" => 21, "V" => 22, "W" => 23, "X" => 24, "Y" => 25, "Z" => 26))
e = sum.(d)
f = Set(Int.([0.5*n*(n+1) for n in 1:100]))
g = is_triangle_word.(e)
filter!(!iszero, g)
s, = size(g)
return s