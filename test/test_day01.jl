day01_testcase = split("199\n200\n208\n210\n200\n207\n240\n269\n260\n263")


@testset "Day 01" begin
    @testset "Part 1" begin
        @test aoc2021.day01.part1(day01_testcase) == 7
    end

    @testset "Part 2" begin
        @test aoc2021.day01.part2(day01_testcase) == 5
    end
end
