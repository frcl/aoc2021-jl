module day10

rev = Dict(')'=>'(', ']'=>'[', '}'=>'{', '>'=>'<')

invalidation_points = Dict(
    ')' => 3,
    ']' => 57,
    '}' => 1197,
    '>' => 25137,
)

completion_points = Dict(
    '(' => 1,
    '[' => 2,
    '{' => 3,
    '<' => 4,
)


function part1(input::Vector{<:AbstractString})
    sum(filter(x -> isa(x, Int), validate.(input)))
end


function validate(line)
    stack = []

    for c in line
        if c in "([{<"
            push!(stack, c)
        elseif rev[c] == stack[end]
            pop!(stack)
        else
            return invalidation_points[c]
        end
    end

    return stack
end


function part2(input::Vector{<:AbstractString})
    stacks = filter(x -> !isa(x, Int), validate.(input))
    scores = stacks .|> score |> sort
    return scores[Int((length(scores)+1)//2)]
end


function score(openings)
    result = 0
    for c in reverse(openings)
        result *= 5
        result += completion_points[c]
    end
    return result
end

end # module
