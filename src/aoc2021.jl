module aoc2021

include("day01.jl")
include("day02.jl")
include("day03.jl")
# to be continued

function run_from_stdin(day::Int, part::Int)
    if day > 9
        func_string = "day$(day)_part$(part)"
    else
        func_string = "day0$(day)_part$(part)"
    end
    println(getfield(aoc2021, Symbol(func_string))(readlines()))
end

export run_from_stdin

end # module
