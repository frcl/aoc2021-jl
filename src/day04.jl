function day04_part1(input::Vector{<:AbstractString})
    numbers, boards, marks, won = prepare_d4(input)
    last_win_score = nothing
    mark(boards, marks, numbers[1:4])
    for n = numbers[5:end]
        mark(boards, marks, [n])
        wins = check_for_wins(marks, won)
        for win = wins
            return score(boards[win], marks[win], n)
        end
    end
end


function day04_part2(input::Vector{<:AbstractString})
    numbers, boards, marks, won = prepare_d4(input)
    last_win_score = nothing
    mark(boards, marks, numbers[1:4])
    for n = numbers[5:end]
        mark(boards, marks, [n])
        wins = check_for_wins(marks, won)
        for win = wins
            won[win] = true
            last_win_score = score(boards[win], marks[win], n)
        end
    end
    return last_win_score
end


function prepare_d4(input::Vector{<:AbstractString})
    numbers, boards = parse_input_d4(input)
    marks = [falses(size(b)) for b = boards]
    won = falses(length(marks))
    return numbers, boards, marks, won
end


parse_int = s -> parse(Int64, s)


function parse_input_d4(input::Vector{<:AbstractString})
    indices = findall(==(""), input)
    section_ranges = vcat([1:(indices[1]-1)], (:).(indices[1:end-1].+1, indices[2:end].-1))
    sections = getindex.(Ref(input), section_ranges)
    return map(parse_int, split(sections[1][1], ',')), map(parse_board, sections[2:end])
end


function parse_board(board::Vector{<:AbstractString})
    reshape([parse_int(n) for line = board for n = split(line)], 5, 5)
end


function mark(boards, marks, numbers)
    for n = numbers
        for (b, m) = zip(boards, marks)
            m .|= (b .== n)
        end
    end
end


function check_for_wins(marks, won)
    [i for (i, m) = enumerate(marks) if !won[i] && has_won(m)]
end


function has_won(m)
    any(sum(m, dims=1) .== size(m)[1]) || any(sum(m, dims=2) .== size(m)[2])
end


function score(board, mark, number)
    return sum(board[.~mark])*number
end
