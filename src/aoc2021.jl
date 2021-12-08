module aoc2021

include("day01.jl")
include("day02.jl")
include("day03.jl")
include("day04.jl")
include("day05.jl")
include("day06.jl")
include("day07.jl")
include("day08.jl")
# to be continued

function get_func(day::Int, part::Int)
    mod = getfield(aoc2021, Symbol(day > 9 ? "day$(day)" : "day0$(day)"))
    return getfield(mod, Symbol("part$(part)"))
end

function run_from_stdin(day::Int, part::Int)
    println(get_func(day, part)(readlines()))
end

export run_from_stdin

end # module
