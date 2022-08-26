using Primes

function has4factor(n)
    if length(factor(Set, n)) == 4
        return true
    else
        return false
    end
end

@inbounds for i in 1:1000000
    if has4factor(i) && has4factor(i+1) && has4factor(i+2) && has4factor(i+3)
        
        return i
    end
end
