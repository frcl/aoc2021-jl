module day17

function part1(input::Vector{<:AbstractString})
    target = parse_input_d17(input)
    paths = [get_path(vx, vy, target[2:3]) for vx in 1:100 for vy in 1:100]
    maximum(maxy(p) for p in paths if hits(p, target))
end


function get_path(vx, vy, maxi)
    p = [(0, 0)]
    while p[end][1] <= maxi[1] && p[end][2] >= maxi[2]
        push!(p, p[end] .+ (vx, vy))
        vx = max(vx-1, 0)
        vy -= 1
    end
    return p
end


function hits(path, target)
    any(target[1] <= x <= target[2] && target[3] <= y <= target[4] for (x, y) in path)
end


function maxy(path)
    maximum(y for (_, y) in path)
end


function part2(input::Vector{<:AbstractString})
    target = parse_input_d17(input)
    length([(vx, vy) for vx in 1:276 for vy in -76:300 if hits(get_path(vx, vy, target[2:3]), target)])
end


function parse_input_d17(input::Vector{<:AbstractString})
    [parse(Int, g) for g in
     match(r"^target area: x=(-?\d+)..(-?\d+), y=(-?\d+)..(-?\d+)$", input[1])]
end

end # module
