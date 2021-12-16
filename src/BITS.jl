module BITS

using Base.Iterators


struct Packet
    version::UInt8
    type_id::UInt8
    payload::Union{Vector{Packet}, Int64}
    Packet(version, type_id, payload) = new(version, type_id, payload)
    Packet(hex_string::String) = consume_packet(Iterators.Stateful(to_bits(hex_string)))
end


function to_bits(hex_string::String)::BitVector
    bytes = reverse(hex2bytes(hex_string))
    bytes = append!(repeat([0x00], 8 - sizeof(bytes)%8), bytes)
    bitvec = falses(sizeof(bytes) << 3)
    bitvec.chunks = reinterpret(UInt64, bytes)
    return reverse(bitvec)
end


function consume_packet(bititr)::Packet
    version = to_int(ctake(bititr, 3))
    type_id = to_int(ctake(bititr, 3))
    if type_id == 4
        payload = consume_value(bititr)
    else
        payload = consume_packets(bititr)
    end
    return Packet(version, type_id, payload)
end


function consume_packets(bititr)::Vector{Packet}
    if popfirst!(bititr) == 0
        bitlength = to_int(ctake(bititr, 15))
        taken = bititr.taken
        v = Packet[]
        while bititr.taken - taken < bitlength
            push!(v, consume_packet(bititr))
        end
        return v
    else
        return [consume_packet(bititr) for _ in 1:to_int(ctake(bititr, 11))]
    end
end


function consume_value(bititr)::Int64
    v = BitVector()
    while popfirst!(bititr) == 1
        append!(v, ctake(bititr, 4))
    end
    append!(v, ctake(bititr, 4))
    return reverse(v).chunks[1]
end


function to_int(v::BitVector)
    reverse(v).chunks[1]
end


function ctake(itr, n)
    BitVector(collect(take(itr, n)))
end

end # module
