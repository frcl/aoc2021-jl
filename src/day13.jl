module day13

function part1(input::Vector{<:AbstractString})
    points, folds = parse_input_d13(input)
    return length(unique(do_fold(points, folds[1])))
end


function do_fold(points, fold_t)
    map(fold(fold_t...), points)
end


function fold(d, n)
    (d == "x" ?
        p -> (p[1] > n ? (2*n-p[1], p[2]) : p) :
        p -> (p[2] > n ? (p[1], 2*n-p[2]) : p))
end


function part2(input::Vector{<:AbstractString})
    points, folds = parse_input_d13(input)
    for f = folds
        points = do_fold(points, f)
    end
    return display_points(points)
end


function display_points(ps)
    grid = fill('.', maximum(p[1] for p = ps)+1, maximum(p[2] for p = ps)+1)
    for p = ps
        grid[p[1]+1, p[2]+1] = '#'
    end
    nl = size(grid)[1]
    return join([String(grid[l:l+nl-1]) for l in 1:nl:length(grid)], "\n")
end


function parse_input_d13(input::Vector{<:AbstractString})
    idx = findfirst(==(""), input)
    point_lines, fold_lines = input[1:idx-1], input[idx+1:end]
    return ([Tuple(parse(Int, n) for n in split(l, ',')) for l in point_lines],
            [(x -> (x[1], parse(Int, x[2])))(match(r"^fold along (x|y)=(\d+)", l)) for l in fold_lines])
end

end # module
