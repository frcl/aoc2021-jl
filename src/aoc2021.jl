module aoc2021

include("day01.jl")
# to be continued

function run_from_stdin(day::Int, part::Int)
    if day > 9
        getfield(aoc2021, Symbol("day$(day)_part$(part)"))(readlines())
    else
        getfield(aoc2021, Symbol("day0$(day)_part$(part)"))(readlines())
    end
end

export run_from_stdin

end # module
