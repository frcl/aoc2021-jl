day02_testcase = split("forward 5\ndown 5\nforward 8\nup 3\ndown 8\nforward 2", '\n')

@testset "Day 02" begin
    @testset "Part 1" begin
        @test aoc2021.day02_part1(day02_testcase) == 150
    end

    @testset "Part 2" begin
        @test aoc2021.day02_part2(day02_testcase) == 900
    end
end
