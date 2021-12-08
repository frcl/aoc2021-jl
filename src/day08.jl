module day08

function part1(input::Vector{<:AbstractString})::Int
    sum(in([2, 3, 4, 7]).([length(d) for (_, o) = parse_input_d08(input) for d = o]))
end


function part2(input::Vector{<:AbstractString})::Int
    sum([resolve(p, o) for (p, o) = parse_input_d08(input)])
end


function resolve(patterns::Vector{<:AbstractString}, output::Vector{<:AbstractString})::Int
    mapping = find_mapping(patterns)
    digits = [mapping[Set(s)] for s = output]
    return sum(digits.*[10^i for i = length(digits)-1:-1:0])
end


function find_mapping(patterns)
    p1, p7, p4, p8 = [get_only(patterns, x -> length(x) == n) for n = [2, 3, 4, 7]]
    p3, p9, p6, p0, p2 = [get_only(patterns, c) for c = [
        x -> length(x) == 5 && issubset(p1, x),
        x -> length(x) == 6 && issubset(p4, x),
        x -> length(x) == 6 && !issubset(p1, x),
        x -> length(x) == 6 && issubset(p1, x) && !issubset(p4, x),
        x -> length(x) == 5 && length(intersect(x, p4)) == 2,
    ]]
    p5 = get_only(patterns, x -> length(x) == 5 && !issubset(p1, x) && Set(x) != p2)
    Dict([(p0, 0), (p1, 1), (p2, 2), (p3, 3), (p4, 4),
          (p5, 5), (p6, 6), (p7, 7), (p8, 8), (p9, 9)])
end


function get_only(collection, condition)
    Set(only([x for x = collection if condition(x)]))
end


function parse_input_d08(input::Vector{<:AbstractString})
    [(split(p), split(o)) for (p, o) = [map(strip, split(l, '|')) for l = input]]
end

end # module
