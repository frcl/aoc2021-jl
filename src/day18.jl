module day18

import Base.+
import Base.==


mutable struct SFNumber
    left::Union{Int, SFNumber}
    right::Union{Int, SFNumber}
    SFNumber(l::Int, r::Int) = new(l, r)
    SFNumber(l::Int, r::Vector{<:Any}) = new(l, SFNumber(r[1], r[2]))
    SFNumber(l::Vector{<:Any}, r::Int) = new(SFNumber(l[1], l[2]), r)
    SFNumber(l::Vector{<:Any}, r::Vector{<:Any}) = new(SFNumber(l[1], l[2]), SFNumber(r[1], r[2]))
    SFNumber(n::Vector{<:Any}) = SFNumber(n[1], n[2])
    SFNumber(a::SFNumber, b::SFNumber) = new(a, b)
end


function ==(a::SFNumber, b::SFNumber)::Bool
    a.left == b.left && a.right == b.right
end


function (+)(a::SFNumber, b::SFNumber)::SFNumber
    c = SFNumber(deepcopy(a), deepcopy(b))
    reduce_sf(c)
    c
end


function reduce_sf(n::SFNumber)
    while true
        result_e = explode_sf(n, 0)
        if result_e == nothing
            result_s = split_sf(n)
            if !result_s
                break
            end
        end
    end
end


function explode_sf(n::SFNumber, nesting::Int)
    if nesting == 3
        if n.left isa SFNumber
            if n.right isa Int
                n.right += n.left.right
            else
                add_to_leftmost(n.right, n.left.right)
            end
            tmp = (n.left.left, nothing)
            n.left = 0
            return tmp
        end
        if n.right isa SFNumber
            if n.left isa Int
                n.left += n.right.left
            else
                add_to_rightmost(n.left, n.right.left)
            end
            tmp = (nothing, n.right.right)
            n.right = 0
            return tmp
        end
    else
        if n.left isa SFNumber
            result_l = explode_sf(n.left, nesting+1)
            if result_l != nothing
                if result_l[2] == nothing
                    return result_l
                else
                    if n.right isa Int
                        n.right += result_l[2]
                    else
                        add_to_leftmost(n.right, result_l[2])
                    end
                    return (result_l[1], nothing)
                end
            end
        end

        if n.right isa SFNumber
            result_r = explode_sf(n.right, nesting+1)
            if result_r != nothing
                if result_r[1] == nothing
                    return result_r
                else
                    if n.left isa Int
                        n.left += result_r[1]
                    else
                        add_to_rightmost(n.left, result_r[1])
                    end
                    return (nothing, result_r[2])
                end
            end
        end

        return nothing
    end
end


function split_sf(n::SFNumber)::Bool
    if n.left isa Int && n.left >= 10
        n.left = _split(n.left)
        return true
    elseif n.left isa SFNumber
        tmp = split_sf(n.left)
        if tmp
            return true
        end
    end
    if n.right isa Int && n.right >= 10
        n.right = _split(n.right)
        return true
    elseif n.right isa SFNumber
        tmp = split_sf(n.right)
        if tmp
            return true
        end
    end
    return false
end


function _split(n::Int)::SFNumber
    SFNumber(floor(Int, n/2), ceil(Int, n/2))
end


function leftmost(n::SFNumber)
    n.left isa SFNumber ? leftmost(n.left) : n
end


function rightmost(n::SFNumber)
    n.right isa SFNumber ? rightmost(n.right) : n
end


function add_to_leftmost(n::SFNumber, val::Int)
    l = leftmost(n)
    l.left += val
end


function add_to_rightmost(n::SFNumber, val::Int)
    l = rightmost(n)
    l.right += val
end


function magnitude(n::SFNumber)::Int
    3*magnitude(n.left) + 2*magnitude(n.right)
end


function magnitude(n::Int)::Int
    n
end


function part1(input::Vector{<:AbstractString})::Int
    magnitude(sum(parse_input_d18(input)))
end


function part2(input::Vector{<:AbstractString})::Int
    sfnums = parse_input_d18(input)
    maximum(magnitude(a+b) for a in sfnums for b in sfnums if a != b)
end


import JSON

function parse_input_d18(input::Vector{<:AbstractString})::Vector{SFNumber}
    [SFNumber(JSON.parse(line)) for line in input]
end

end # module
