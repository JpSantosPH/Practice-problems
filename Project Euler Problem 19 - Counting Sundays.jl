# How many Sundays fell on the first of the month during the
# twentieth century (1 Jan 1901 to 31 Dec 2000)?
date = 3
day = 1
month = 1
day_in_month = 31
year = 1901
sun_on_day_1 = 0
# println([date], [day], [month], [year])
while true
    while true
        if day == 1 && date == 1
            sun_on_day_1 = sun_on_day_1 + 1
        end
        if date != 7
            date = date + 1
        elseif date == 7
            date = 1
        end
        if day < day_in_month
            day = day + 1
        elseif day >= day_in_month
            break
        end        
    end
    if issubset(month, [3, 5, 8, 10])
        month = month + 1
        day_in_month = 30
    elseif issubset(month, [2, 4, 5, 6, 7, 9, 11])
        month = month + 1
        day_in_month = 31
    elseif month == 1
        month = month + 1
        if year % 4 != 0 || (year % 100 == 0 && year % 400 == 0)
        day_in_month = 28
        elseif year % 4 == 0
        day_in_month = 29
        end
    elseif month == 12
        year = year + 1
        month = 1
    end
    day = 1
    if  year > 2000
        break
    end
end
sun_on_day_1