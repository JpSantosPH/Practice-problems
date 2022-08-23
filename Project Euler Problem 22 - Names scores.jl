txt = open("p022_names.txt") do file
    read(file, String)
end

splitted = split(txt, ",")
chopped = (chop.(splitted, head = 1, tail = 1))
namelist = sort(chopped, alg = InsertionSort)
letters_namelist = split.(namelist, "")
numbers_namelist = Vector{Vector{Int64}}(replace.(letters_namelist, "A" => 1, "B" => 2, "C" => 3 ,"D" => 4 ,"E" => 5 ,"F" => 6 ,"G" => 7, "H" => 8, "I" => 9, "J" => 10, "K" => 11, "L" => 12, "M" => 13, "N" => 14, "O" => 15, "P" => 16, "Q" => 17, "R" => 18, "S" => 19, "T" => 20, "U" => 21, "V" => 22, "W" => 23, "X" => 24, "Y" => 25, "Z" => 26))
sum_namelist = sum.(numbers_namelist)
l, = size(sum_namelist)
namescore_sum = 0
for i in 1:l
    namescore_sum = namescore_sum + (sum_namelist[i] * i)
end
namescore_sum