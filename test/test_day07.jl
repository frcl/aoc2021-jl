day07_testcase = ["16,1,2,0,4,2,7,1,2,14"]


@testset "Day 07" begin
    @testset "Part 1" begin
        @test aoc2021.day07_part1(day07_testcase) == 37
    end

    @testset "Part 2" begin
        @test aoc2021.day07_part2(day07_testcase) == 168
    end
end
