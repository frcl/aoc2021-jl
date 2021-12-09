module day09

function part1(input::Vector{<:AbstractString})
    m = parse_input_d09(input)
    sum(m[get_mask(m)] .+ 1)
end


function parse_input_d09(input::Vector{<:AbstractString})
    reshape([parse(Int16, d) for l = input for d = l], length(input[1]), length(input))
end


function get_mask(m)
    col = reshape(ones(Int16, size(m)[1]), 1, size(m)[1])
    row = reshape(ones(Int16, size(m)[2]), 1, size(m)[2])
    ((vcat(row, m[1:end-1, :] - m[2:end, :]) .> 0)
     + (vcat(m[2:end, :] - m[1:end-1, :], row) .> 0)
     + (vcat(col, (m[:, 1:end-1] - m[:, 2:end])')' .> 0)
     + (vcat((m[:, 2:end] - m[:, 1:end-1])', col)' .> 0)
    ) .== 4
end


function part2(input::Vector{<:AbstractString})
    m = parse_input_d09(input)
    basins = unique([get_basin(m, idx) for idx = findall(==(1), get_mask(m))])
    return prod(sort(map(sum, basins))[end-2:end])
end


function get_basin(m, idx)
    basin = falses(size(m))
    basin[idx] = true
    while growbasin(m, basin) end
    return basin
end


function growbasin(m, basin)
    has_changed = false
    for idx = findall(==(1), basin)
        for step in map(CartesianIndex, [(1, 0), (-1, 0), (0, 1), (0, -1)])
            x = idx+step
            if 0 in x.I || x[1] > size(m)[1] || x[2] > size(m)[2] || basin[x]
                continue
            end
            if m[x] != 9 && m[x] >= m[idx]
                basin[x] = true
                has_changed = true
            end
        end
    end
    return has_changed
end

end # module
