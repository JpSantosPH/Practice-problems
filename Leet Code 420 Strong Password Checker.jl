function strong_password_checker(password::String)
    password_length = length(password)
    if password_length < 1
        return println("password length must be at least 1")
    elseif  password_length > 50
        return println("password length must be at most 50")
    end
    criteria = BitArray([   true # [1] # has at least 6 characters and at most 20 characters.
                            true # [2] # has at least 1 lowercase letter
                            true # [3] # has at least 1 uppercase letter
                            true # [4] # has at least 1 digit
                            true # [5] # does not contain three repeating characters
                            ])
    steps_needed = [    0 # [1] # to fix critera 1
                        0 # [2] # to fix critera 2, 3, and 4
                        0 # [5] # to fix critera 5
                        ]
    criteria[1] = 6 <= password_length <= 20
        # checks at least 6 characters and at most 20 characters.
    criteria[2] = occursin(r"[a-z]", password)
        # checks if the password has at least 1 lowercase letter 
    criteria[3] = occursin(r"[A-Z]", password)
        # checks if the password has at least 1 uppercase letter 
    criteria[4] = occursin(r"[0-9]", password)
        # checks if the password has at least 1 lowercase letter
    for i in 1:(password_length-2)
        has_3_repeating = (password[i] == password[i+1] ==  password[i+2])
        if has_3_repeating == true
            criteria[5] = false
        end
    end
        # checks if the password does not contain three repeating characters
    if all(criteria) == true
        return 0    # stap, password is strong
    end # not strong, calculate steps needed

    if password_length < 6
        steps_needed[1] = 6 - password_length
    elseif password_length > 20
        steps_needed[1] = password_length - 20
    end
        # calculates the steps needed to fix critera 1
    if criteria[2] == false
        steps_needed[2] = steps_needed[2] + 1
    end
        # calculates the steps needed to fix critera 2
    if criteria[3] == false
        steps_needed[2] = steps_needed[2] + 1
    end
        # calculates the steps needed to fix critera 3
    if criteria[4] == false
        steps_needed[2] = steps_needed[2] + 1
    end
        # calculates the steps needed to fix critera 4

    metadata = Vector{Int64}(zeros(password_length))
    number_consecutive = [1]
    for i in 1:(password_length - 1)
        if password[i] == password[i + 1]
            number_consecutive[1] = number_consecutive[1] + 1
            metadata[i] = number_consecutive[1] 
        elseif password[i] != password[i + 1]
            number_consecutive[1] = 1
        end
    end
    metadata
    replace!(metadata, 2=>0)
        # converts password into metadata
    metadata_size, = size(metadata)

    if password_length > 20
        to_remove = [password_length - 20]
        println(to_remove)
        while to_remove[1] != 0
            (x, y) = findmax(metadata)
            metadata[y] = 0
            to_remove[1] = to_remove[1] - 1
        end
    end
        # removes character, fixes critera 1

    block = Int[]
    for i in 1:(metadata_size - 2)
        if (metadata[i] == 0) && (metadata[i + 1] == 3) && (metadata[i + 2] == 0)
            push!(block, metadata[i + 1])
        elseif (metadata[i] < metadata[i + 1]) && (metadata[i + 2] == 0)
            push!(block, metadata[i + 1])
        end
    end
    block_size, = size(block)
        #converts metadata into blocks

    for i in 1:block_size
        steps_needed[3] = steps_needed[3] + floor(block[i] / 3)
    end
    if password_length > 20
        if steps_needed[2] > steps_needed[3]
            return steps_needed[1] + steps_needed[2]
        elseif steps_needed[3] >= steps_needed[2]
            return steps_needed[1] + steps_needed[3]
        end
    elseif 6 <= password_length <= 20
        if steps_needed[2] > steps_needed[3]
            return steps_needed[2]
        elseif steps_needed[3] >= steps_needed[2]
            return steps_needed[3]    
        end
    elseif password_length < 6
        if (steps_needed[1] > steps_needed[2]) && (steps_needed[2] != 0) || (steps_needed[1] > steps_needed[3]) && (steps_needed[3] != 0)
            return steps_needed[1]
        elseif steps_needed[2] >= steps_needed[1]
            return steps_needed[2]
        elseif steps_needed[3] >= steps_needed[1]
            steps_needed[3]
        end
        return println(999)
    end
end

strong_password_checker("1aaaaa")