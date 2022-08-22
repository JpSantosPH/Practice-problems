# 1 => "one" # 3
# 2 => "two" # 3
# 3 => "three" # 5
# 4 => "four" # 4
# 5 => "five" # 4
# 6 => "six" # 3
# 7 => "seven" # 5
# 8 => "eight" # 5
# 9 => "nine" # 4

# 10 => "ten" # one
# 11 => "eleven" # ten + one
# 12 => "twelve" # ten + two
# 13 => "thirteen" # ten + three
# 14 => "fourteen" # ten + four + 1
# 15 => "fifteen" # ten + five
# 16 => "sixteen" # ten + six + 1
# 17 => "seventeen" # ten + seven + 1
# 18 => "eighteen" # ten + eight
# 19 => "nineteen" # ten + nine + 1

# 20-29 => "twenty" # two + num + 3
# 30-39 => "thirty" # three + num + 1
# 40-49 => "forty" # four + num + 1
# 50-59 => "fifty" # five + num + 1
# 60-69 => "sixty" # six + num + 2
# 70-79 => "seventy" # seven + num + 2
# 80-89 => "eighty" # eight + num + 1
# 90-:99 => "ninety" # nine + num + 2

# (1-9)00 => "num hundred" # num + 7
# 101 => "num hundred and" # num + 10
# 1000 => "one thousand" # num + 8
function number_letter_count(n)
    char = 0
    for i in 1:n
        l = 0
        m = digits(i)
        s, = size(m)
        if s == 1
            l = l
        elseif issubset(i, 10:19)
            if issubset(m[1], [4, 6, 7, 9])
                l = l + 1
            else
                l = l
            end
        elseif s == 2
            if issubset(m[2], [3, 4, 5, 8])
                l = l + 1
            elseif issubset(m[2], [6, 7, 9])
                l = l + 2
            elseif issubset(m[2], [2])
                l = l + 3
            end
        elseif s == 3
            if m[2] == 0 && m[1] == 0
                l = l + 7
            else
                l = l + 10
            end
            if m[2] == 0
                l = l
            elseif m[2] == 1
                if issubset(m[1], [4, 6, 7, 9])
                    l = l + 1
                else
                    l = l
                end
            elseif issubset(m[2], [2, 3, 4, 5, 6, 7, 8, 9])
                if issubset(m[2], [3, 4, 5, 8])
                    l = l + 1
                elseif issubset(m[2], [6, 7, 9])
                    l = l + 2
                elseif issubset(m[2], [2])
                    l = l + 3
                end
            end
        elseif s == 4
            l = l + 8    
        end
        replace!(m, 1=>3, 2=>3, 3=>5, 4=>4, 5=>4, 6=>3, 7=>5, 8=>5, 9=>4)
        l = l + sum(m)
        char = char + l
        l = 0
    end
    println(char)
end

number_letter_count(1000)
# works for 1:1000
# expected answer 21124 for 1000
# needs a little extre code for thousands and millions, I'm tired give me a break