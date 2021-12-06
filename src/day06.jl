function day06_part1(input::Vector{<:AbstractString})
    run(input, 80)
end


function day06_part2(input::Vector{<:AbstractString})
    run(input, 256)
end


function run(input, n_iter)
    state = parse_input_d6(input)

    for _ = 1:n_iter
        state = step(state)
    end

    return sum(state)
end


function step(state::Vector{<:Integer})
    (vcat(circshift(state[1:7], -1), [0, state[1]])
     + [0, 0, 0, 0, 0, 0, state[8], state[9], 0])
end


function parse_input_d6(input::Vector{<:AbstractString})
    ages = [parse(Int64, s) for s = split(input[1], ',')]
    return [count(==(n), ages) for n = 0:8]
end
