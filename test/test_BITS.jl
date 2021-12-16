using aoc2021.BITS: Packet


@testset "BITS" begin
    @testset "Packet" begin
        let packet = Packet("D2FE28")
            @test packet.version == 6
            @test packet.type_id == 4
            @test packet.payload == 2021
        end
        let packet = Packet("38006F45291200")
            @test packet.version == 1
            @test packet.type_id == 6
            @test packet.payload[1].payload == 10
            @test packet.payload[2].payload == 20
        end
        let packet = Packet("EE00D40C823060")
            @test packet.version == 7
            @test packet.type_id == 3
            @test packet.payload[1].payload == 1
            @test packet.payload[2].payload == 2
            @test packet.payload[3].payload == 3
        end
    end
end
