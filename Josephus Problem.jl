function best_position(num_people, start_point, num_to_be_skipped, direction)
    # bounds the input variables
        if num_people == 1
            return "[1]"
            num_people < start_point 
            return "Not possible"
        elseif start_point <= 0
            return "Not possible"
        elseif num_to_be_skipped <= 0
            return "Not possible"
        elseif num_people < 1
            return "Not possible"
        elseif  abs(direction) != 1
            return "Not possible"
        end
    # functions for broadcasting
        function execute_if_approx(u)
            if zeta^n[1] ≈ u
                u = 0.0 + 0.0im
            elseif zeta^n[1] == u
                u = 0.0 + 0.0im
            end
            u
        end
        function check_alive(u)
            zeta^n[1] ≈ u
        end
    circle = complex(ones(num_people)) # forms the execution cricle
    # places the people on the circle
    for i in 1:num_people
        circle[i] = exp((2π * im) / (num_people))^(i-1)
    end
    circle
    zeta = exp((2π * im) / (num_people) * direction) # tells the executioner how many people there are
    n = [start_point - 1] # tells the executioner where to start # redo start position
    skip_left = [num_to_be_skipped + 1] # go 1 by one instead of jumping
    deadge = [0] # deadge count
    while true # start executing
        circle = execute_if_approx.(circle) # kills 1 person
        deadge[1] = deadge[1] + 1 # add 1 to the deadge count
        skip_left[1] = num_to_be_skipped + 1
        while skip_left[1] != 0 # skip n amount of person
            n[1] = n[1] + 1 # move by 1 person
            if  zeta^n[1] ≈ zeta^(start_point - 1) # check if the executioner is back to where it started
                n[1] = start_point - 1 # retrun the count 
            end
            # check if the person is alive
            if filter!(isone, check_alive.(circle)) == [1] # if the person is alive
                skip_left[1] = skip_left[1] - 1 # a person is skipped, update skip counter
            else # if the person is dead
                skip_left[1] = skip_left[1] # no one was skipped, keep skip counter
                # I know that this not necessary
            end
        end
        # found the next person to be executed
        if deadge[1] == num_people - 1 # if there is one remaining
            break # look at the circle
        end
    end
    for i in eachindex(circle) # linear indexing
        if circle[i] != 0
            println([i], " if ", [num_people], [start_point], [num_to_be_skipped], [direction])
        end
    end
end

best_position(100, 32, 5, -1)

for i in 2:50
    best_position(i, 1, 3, -1)

end
# num_people, start_point, num_to_be_skipped, direction(-1 == ccw, 1 == cw)