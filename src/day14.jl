module day14

function part1(input::Vector{<:AbstractString})
    run(input, 10)
end


function part2(input::Vector{<:AbstractString})
    run(input, 40)
end


function run(input, iterations)
    template, rules = parse_input_d14(input)

    pair_freqs = Dict(k => 0 for k in keys(rules))
    for i in 1:length(template)-1
        pair_freqs[template[i:i+1]] += 1
    end

    for _ in 1:iterations
        pair_freqs = apply_rules(pair_freqs, rules)
    end

    elements = unique(c[1] for c in values(rules))
    double_freqs = [sum(v*count(==(c), k) for (k, v) in pair_freqs) for c in elements]
    double_freqs[findfirst(==(template[1]), elements)] += 1
    double_freqs[findfirst(==(template[end]), elements)] += 1
    return Int((maximum(double_freqs) - minimum(double_freqs))/2)
end


function apply_rules(pair_freqs, rules)
    new_pair_freqs = Dict(k => 0 for k in keys(rules))
    for (pair, insertion) in rules
        new_pair_freqs[pair[1]*insertion] += pair_freqs[pair]
        new_pair_freqs[insertion*pair[2]] += pair_freqs[pair]
    end
    return new_pair_freqs
end


function parse_input_d14(input::Vector{<:AbstractString})
    input[1], Dict(Tuple(split(l, " -> ")) for l = input[3:end])
end

end # module
