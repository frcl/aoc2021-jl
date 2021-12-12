module day12

function part1(input::Vector{<:AbstractString})
    count_paths("start", parse_input_d12(input), [])
end


function part2(input::Vector{<:AbstractString})
    count_paths("start", parse_input_d12(input), []; max_lower=2)
end


function count_paths(start, nodes, visited; max_lower=1)
    if start == "end"
        return 1
    else
        nvis = vcat(visited, [start])
        return sum(count_paths(n, nodes, nvis; max_lower) for n = nodes[start]
                   if is_valid(n, nvis, max_lower); init=0)
    end
end


function is_valid(node, visited, max_lower)
    (node != "start" && !(node in visited && islowercase(node[1])
        && any(count(==(v), visited) == max_lower for v = visited if islowercase(v[1]))))
end


function parse_input_d12(input::Vector{<:AbstractString})
    edges = [Tuple(split(l, '-')) for l = input]
    nodes = Dict()
    for e = edges
        dests = get!(nodes, e[1], [])
        push!(dests, e[2])
        dests = get!(nodes, e[2], [])
        push!(dests, e[1])
    end
    return nodes
end

end # module
