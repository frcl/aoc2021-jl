module day02

function part1(input::Vector{<:AbstractString})
    steps = parse_input_d2(input)
    xpos = sum_over(steps, "forward")
    depth = sum_over(steps, "down") - sum_over(steps, "up")
    return xpos*depth
end


function part2(input::Vector{<:AbstractString})
    steps = parse_input_d2(input)

    aim = 0
    xpos = 0
    depth = 0

    for (direction, x) = steps
        if direction == "forward"
            xpos += x
            depth += x*aim
        elseif direction == "up"
            aim -= x
        elseif direction == "down"
            aim += x
        end
    end

    return xpos*depth
end


function parse_input_d2(input::Vector{<:AbstractString})
    return [(m.captures[1], parse(Int32, m.captures[2]))
            for m = map(l -> match(r"^(forward|up|down) (\d+)$", l), input)]
end


function sum_over(steps, direction)
    return sum([s[2] for s = steps if s[1] == direction])
end

end # module
