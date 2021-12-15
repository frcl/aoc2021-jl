module day15

function part1(input::Vector{<:AbstractString})
    dijkstra(parse_input_d15(input))
end


function part2(input::Vector{<:AbstractString})
    grid = parse_input_d15(input)
    large_grid = hvcat((5, 5, 5, 5, 5), (grid .+ (i+j) for i in 0:4 for j in 0:4)...)
    large_grid[large_grid .> 9] .-= 9
    dijkstra(large_grid)
end


function dijkstra(grid)
    root = CartesianIndex((1, 1))
    dest = CartesianIndex(size(grid))
    visited = Set([root])
    distance = Dict(root => 0)
    queue = Set([root])

    while !isempty(queue)
        cur = let foo = [n for n in queue]
            foo[argmin(distance[n] for n in foo)]
        end
        if cur == dest
            return distance[cur]
        end
        for step in map(CartesianIndex, [(-1, 0), (1, 0), (0, 1), (0, -1)])
            node = cur+step
            if !(node in visited) && isvalid(node, size(grid)[1])
                tmp = distance[cur] + grid[node]
                if !(node in keys(distance) && distance[node] < tmp)
                    distance[node] = tmp
                end
                if !(node in queue)
                    push!(queue, node)
                end
            end
        end
        push!(visited, cur)
        delete!(queue, cur)
    end
end


function isvalid(idx, max)
    !any(idx.I .< 1) && !any(idx.I .> max)
end


function parse_input_d15(input::Vector{<:AbstractString})
    reshape([parse(Int8, c) for l in input for c in l], length(input), length(input[1]))
end

end # module
