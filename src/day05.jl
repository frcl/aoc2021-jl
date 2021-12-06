function day05_part1(input::Vector{<:AbstractString})
    find_doubles([(p1, p2) for (p1, p2) = parse_input_d5(input) if p1[1] == p2[1] || p1[2] == p2[2]])
end


function day05_part2(input::Vector{<:AbstractString})
    find_doubles(parse_input_d5(input))
end


function find_doubles(line_specs)
    field = zeros(Int32,
        maximum(vcat([l[1][1] for l = line_specs], [l[2][1] for l = line_specs])),
        maximum(vcat([l[1][2] for l = line_specs], [l[2][2] for l = line_specs])),
    )
    for ((x1, y1), (x2, y2)) = line_specs
        if x1 == x2
            for y = (y1 < y2 ? (y1:y2) : (y1:-1:y2))
                field[x1, y] += 1
            end
        elseif y1 == y2
            for x = (x1 < x2 ? (x1:x2) : (x1:-1:x2))
                field[x, y1] += 1
            end
        else
            for (x, y) = zip(x1 < x2 ? (x1:x2) : (x1:-1:x2), y1 < y2 ? (y1:y2) : (y1:-1:y2))
                 field[x, y] += 1
            end
        end
    end
    return sum(field .>= 2)
end


function parse_input_d5(input::Vector{<:AbstractString})
    matches = [match(r"^(\d+),(\d+) -> (\d+),(\d+)", line) for line = input]
    p = x -> parse(Int32, x) + 1 # add one because input is zero indexed
    return [((p(g[1]), p(g[2])), (p(g[3]), p(g[4]))) for g = matches]
end
