function day07_part1(input::Vector{<:AbstractString})
    positions = parse_input_d7(input)
    return absolute_error(median(positions), positions)
end


function day07_part2(input::Vector{<:AbstractString})
    positions = parse_input_d7(input)
    m = mean(positions)
    opt_pos = Int32(round(m +
        (sum((positions .- m) .> 0) - sum((positions .- m) .< 0))/(2*length(positions))
    ))
    return absolute_cumulative_error(opt_pos, positions)
end


function parse_input_d7(input::Vector{<:AbstractString})
    [parse(Int32, s) for s = split(input[1], ',')]
end


function median(positions)
    sort(positions)[Int32(round(length(positions)/2))]
end


function mean(positions)
    sum(positions)/length(positions)
end


function absolute_error(x, positions)
    sum(abs.(positions .- x))
end


function absolute_cumulative_error(x, positions)
    sum(metric.(abs.(positions .- x)))
end


function metric(n)
    sum(1:n)
end
