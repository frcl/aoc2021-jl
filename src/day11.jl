module day11

steps = CartesianIndices((-1:1, -1:1))

function part1(input::Vector{<:AbstractString})
    energies = parse_input_d11(input)
    total_flashes = 0
    for _ = 1:100
        total_flashes += advance(energies)
    end
    return total_flashes
end


function advance(m)
    flashed = falses(size(m))
    m .+= 1
    while true
        idxs = filter(x -> !flashed[x], findall(>(9), m))
        for idx = idxs
            for loc in filter(valid_loc, steps .+ idx)
                m[loc] += 1
            end
            flashed[idx] = true
        end
        isempty(idxs) && break
    end
    m[m .> 9] .= 0
    return sum(flashed)
end


function valid_loc(loc::CartesianIndex)::Bool
    !(0 in loc.I) && !(11 in loc.I)
end


function part2(input::Vector{<:AbstractString})
    energies = parse_input_d11(input)
    for i = 1:1000
        if advance(energies) == 100
            return i
        end
    end
end


function parse_input_d11(input::Vector{<:AbstractString})
    reshape([parse(Int8, d) for l = input for d = l], 10, 10)
end

end # module
