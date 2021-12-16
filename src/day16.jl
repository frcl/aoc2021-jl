module day16

using ..aoc2021: Packet


function part1(input::Vector{<:AbstractString})
    sum_versions(Packet(input[1]))
end


function part2(input::Vector{<:AbstractString})
    decode(Packet(input[1]))
end


function sum_versions(packet::Packet)::Int64
    packet.version + if packet.payload isa Vector
        sum(sum_versions(p) for p in packet.payload)
    else
        0
    end
end


function decode(packet::Packet)::Int64
    if packet.type_id == 0
        sum(decode(p) for p in packet.payload)
    elseif packet.type_id == 1
        prod(decode(p) for p in packet.payload)
    elseif packet.type_id == 2
        minimum(decode(p) for p in packet.payload)
    elseif packet.type_id == 3
        maximum(decode(p) for p in packet.payload)
    elseif packet.type_id == 4
        packet.payload
    elseif packet.type_id == 5
        decode(packet.payload[1]) > decode(packet.payload[2]) ? 1 : 0
    elseif packet.type_id == 6
        decode(packet.payload[1]) < decode(packet.payload[2]) ? 1 : 0
    elseif packet.type_id == 7
        decode(packet.payload[1]) == decode(packet.payload[2]) ? 1 : 0
    end
end

end # module
