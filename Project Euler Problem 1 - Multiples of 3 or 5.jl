# Project Euler Problem 1
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
# The sum of these muliples is 23.
# FInd the sum of all the multiples of 3 or 5 below 1000

sum_div_3_5(n) = sum(union(3:3:n, 5:5:n))

sum_div_3_5(999)