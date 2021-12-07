module day01

function part1(input::Vector{<:AbstractString})
    depth_values = parse_input_d1(input)
    return count_incs(depth_values)
end


function part2(input::Vector{<:AbstractString})
    depth_values = parse_input_d1(input)
    n = length(depth_values)
    return count_incs(depth_values[1:n-2] + depth_values[2:n-1] + depth_values[3:n])
end


function parse_input_d1(input::Vector{<:AbstractString})
    return [parse(Int32, i) for i = input]
end


function count_incs(vec::Vector{Int32})
    n = length(vec)
    inc = vec[2:n] - vec[1:n-1]
    return sum([1 for i = inc if i > 0])
end

end # module
