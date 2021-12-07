module day03

function part1(input::Vector{<:AbstractString})
    counts = sum(parse_input_d3(input))
    gamma_digits = [c > length(input)/2 ? 1 : 0 for c = counts]
    epsilon_digits = [d == 0 ? 1 : 0 for d = gamma_digits]
    gamma = UInt32(from_binary(gamma_digits))
    epsilon = UInt32(from_binary(epsilon_digits))
    return gamma*epsilon
end


function part2(input::Vector{<:AbstractString})
    digits = parse_input_d3(input)
    oxygen = from_binary(find_number(digits, 1))
    co2 = from_binary(find_number(digits, 0))
    return oxygen*co2
end


function find_number(list, bit_crit)
    if bit_crit == 1
        con1, con2 = 1, 0
    else
        con1, con2 = 0, 1
    end

    for j in 1:length(list[1])
        if length(list) == 1
            break
        end
        count = sum([d[j] for d = list])
        if count >= length(list)/2
            list = [d for d = list if d[j] == con1]
        else
            list = [d for d = list if d[j] == con2]
        end
    end

    return list[1]
end


function from_binary(digits::Vector{<:Integer})
    return sum(digits.*[2^n for n = (length(digits)-1):-1:0])
end


function parse_input_d3(input::Vector{<:AbstractString})
    return [[parse(Int32, d) for d = split(n, "")] for n = input]
end

end # module
