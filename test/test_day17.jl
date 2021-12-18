day17_testcase = ["target area: x=20..30, y=-10..-5"]


@testset "Day 17" begin
    @testset "Part 1" begin
        let target = aoc2021.day17.parse_input_d17(day17_testcase)
            @test aoc2021.day17.hits(aoc2021.day17.get_path(6, 3, target[2:3]), target)
            @test aoc2021.day17.hits(aoc2021.day17.get_path(9, 0, target[2:3]), target)
        end
        @test aoc2021.day17.part1(day17_testcase) == 45
    end

    @testset "Part 2" begin
        @test aoc2021.day17.part2(day17_testcase) == 112
    end
end
