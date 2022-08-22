# additional: for finding the nth term in the Fibonacci sequence whose values does not exceed x

function fib_nth_floorterm(n)
    f = [1, 2];
        for i in 3:n
            push!(f, 0)
            f[i] = f[i-2] + f[i-1]
            if f[i] > n
                return [i-1, f[i-1]]
            end
        end
end

fib_nth_floorterm(4_000_000)
